@echo off
setlocal
cd /d "%~dp0"

set "BOOTSTRAP_PYTHON_EXE="
set "BOOTSTRAP_PYTHON_ARGS="
set "VENV_DIR=venv"
set "VENV_PYTHON=%VENV_DIR%\Scripts\python.exe"
set "VENV_ACTIVATE=%VENV_DIR%\Scripts\activate.bat"
set "BACKEND_URL=http://127.0.0.1:8000/"
set "FRONTEND_URL=http://127.0.0.1:5173/"

for /f "delims=" %%I in ('where python 2^>nul') do (
    set "BOOTSTRAP_PYTHON_EXE=%%I"
    goto :python_detected
)

where py >nul 2>nul
if not errorlevel 1 (
    set "BOOTSTRAP_PYTHON_EXE=py"
    set "BOOTSTRAP_PYTHON_ARGS=-3"
)

:python_detected
if not defined BOOTSTRAP_PYTHON_EXE (
    echo [WARN] Python was not found. Installing Python 3.12 via winget...
    where winget >nul 2>nul
    if errorlevel 1 (
        echo [ERROR] winget is not available. Install Python 3.10+ manually and add it to PATH.
        exit /b 1
    )

    winget install -e --id Python.Python.3.12 --silent --accept-package-agreements --accept-source-agreements
    if errorlevel 1 (
        echo [ERROR] Failed to install Python. Install Python 3.10+ manually and add it to PATH.
        exit /b 1
    )

    for /f "delims=" %%I in ('where python 2^>nul') do (
        set "BOOTSTRAP_PYTHON_EXE=%%I"
        goto :python_installed
    )

    where py >nul 2>nul
    if not errorlevel 1 (
        set "BOOTSTRAP_PYTHON_EXE=py"
        set "BOOTSTRAP_PYTHON_ARGS=-3"
    )
)

:python_installed
if not defined BOOTSTRAP_PYTHON_EXE (
    echo [ERROR] Python 3.10+ is still not available after installation.
    echo [HINT] Reopen terminal and ensure Python is added to PATH.
    exit /b 1
)

echo [INFO] Using bootstrap Python: %BOOTSTRAP_PYTHON_EXE% %BOOTSTRAP_PYTHON_ARGS%

if not exist "%VENV_PYTHON%" (
    echo [INFO] Creating virtual environment at %VENV_DIR%...
    "%BOOTSTRAP_PYTHON_EXE%" %BOOTSTRAP_PYTHON_ARGS% -m venv "%VENV_DIR%"
    if errorlevel 1 (
        echo [ERROR] Failed to create virtual environment.
        exit /b 1
    )
)

if not exist "%VENV_ACTIVATE%" (
    echo [ERROR] Virtual environment activation script not found at %VENV_ACTIVATE%
    exit /b 1
)

call "%VENV_ACTIVATE%"
if errorlevel 1 (
    echo [ERROR] Failed to activate virtual environment.
    exit /b 1
)

set "PYTHON_EXE=python"

if not exist "frontend\package.json" (
    echo [ERROR] Frontend package.json not found at frontend\package.json
    exit /b 1
)

if not exist "breast_cancer_system\requirements.txt" (
    echo [ERROR] Backend requirements file not found at breast_cancer_system\requirements.txt
    exit /b 1
)

where npm >nul 2>nul
if errorlevel 1 (
    echo [ERROR] npm was not found in PATH. Install Node.js and reopen terminal.
    exit /b 1
)

echo [INFO] Ensuring backend Python dependencies are installed...
python -m pip install -r "breast_cancer_system\requirements.txt" >nul
if errorlevel 1 (
    echo [ERROR] Failed to install backend dependencies.
    exit /b 1
)

echo [INFO] Ensuring frontend node_modules are installed...
if not exist "frontend\node_modules" (
    call npm --prefix frontend install
    if errorlevel 1 (
        echo [ERROR] Failed to install frontend dependencies.
        exit /b 1
    )
)

echo [INFO] Checking backend service...
call :check_url "%BACKEND_URL%"
if errorlevel 1 (
    echo [INFO] Starting backend on port 8000...
    start "Breast Cancer Backend" "%PYTHON_EXE%" -m uvicorn main:app --reload --host 127.0.0.1 --port 8000
    call :wait_for_url "%BACKEND_URL%" "Backend"
    if errorlevel 1 (
        echo [ERROR] Backend did not start on port 8000 in time.
        exit /b 1
    )
) else (
    echo [INFO] Backend is already running.
)

echo [INFO] Checking frontend service...
call :check_url "%FRONTEND_URL%"
if errorlevel 1 (
    echo [INFO] Starting frontend on port 5173...
    start "Breast Cancer Frontend" cmd /c "cd /d frontend && npm run dev -- --host 127.0.0.1 --port 5173 --strictPort"
    call :wait_for_url "%FRONTEND_URL%" "Frontend"
    if errorlevel 1 (
        echo [ERROR] Frontend did not start on port 5173 in time.
        exit /b 1
    )
) else (
    echo [INFO] Frontend is already running.
)

echo [INFO] Opening browser tabs...
start "" "http://127.0.0.1:8000/docs"
start "" "http://127.0.0.1:5173"

echo.
echo [LINK] Backend API Docs: http://127.0.0.1:8000/docs
echo [LINK] Frontend App:     http://127.0.0.1:5173
echo.
echo [OK] Application is ready.
exit /b 0

:check_url
powershell -NoProfile -Command "try { $r = Invoke-WebRequest -UseBasicParsing '%~1'; if ($r.StatusCode -eq 200) { exit 0 } else { exit 1 } } catch { exit 1 }"
exit /b %errorlevel%

:wait_for_url
powershell -NoProfile -Command "for ($i = 0; $i -lt 60; $i++) { try { $r = Invoke-WebRequest -UseBasicParsing '%~1'; if ($r.StatusCode -eq 200) { exit 0 } } catch { } Start-Sleep -Seconds 1 }; exit 1"
if errorlevel 1 (
    echo [ERROR] %~2 health check failed.
)
exit /b %errorlevel%
