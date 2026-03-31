# Breast Cancer Detection and Prevention

A comprehensive full-stack application for breast cancer detection using machine learning and personalized medicine recommendations. The system provides predictive analysis, probability scoring, and data-driven medical guidance.

## 🎯 Features

- **ML-Powered Prediction**: Advanced machine learning model for breast cancer detection and classification
- **Probability Scoring**: Detailed probability analysis and confidence metrics
- **Medicine Recommendations**: AI-driven medicine and treatment suggestions based on patient data
- **Patient Management**: Secure patient registration and profile management
- **Report Generation**: Automated CSV/PDF report exports for medical records
- **RESTful API**: Complete FastAPI backend with Swagger documentation
- **Modern UI**: React/TypeScript frontend with Vite
- **Database Storage**: Persistent data management with SQLAlchemy ORM
- **JWT Authentication**: Secure token-based authentication

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    React Frontend (Vite)                    │
│                   React + TypeScript                        │
└──────────────────────────┬──────────────────────────────────┘
                           │ HTTP/REST
┌──────────────────────────▼──────────────────────────────────┐
│                    FastAPI Backend                          │
│  ├─ Auth Routes (JWT)                                       │
│  ├─ Patient Management                                      │
│  ├─ Prediction Service                                      │
│  ├─ Medicine Recommendations                                │
│  └─ Report Export                                           │
└──────────────────────────┬──────────────────────────────────┘
                           │ SQL
┌──────────────────────────▼──────────────────────────────────┐
│              Database (MySQL/SQLite)                        │
│  ├─ Users Table                                             │
│  ├─ Reports Table                                           │
│  └─ Metadata                                                │
└─────────────────────────────────────────────────────────────┘
```

## 📋 Tech Stack

### Backend
- **Framework**: FastAPI (Python)
- **ORM**: SQLAlchemy
- **Database**: MySQL/SQLite
- **ML**: Scikit-learn, NumPy, Pandas
- **Server**: Uvicorn
- **Authentication**: JWT (PyJWT)

### Frontend
- **Framework**: React 18+
- **Language**: TypeScript
- **Build Tool**: Vite
- **Styling**: CSS3

### Data & ML
- **Model**: Pre-trained breast cancer classifier
- **Data Processing**: Pandas, NumPy
- **Datasets**: Medical records, drug catalogs, NHANES data

## 🚀 Quick Start

### Prerequisites
- Python 3.10+
- Node.js 16+
- Git

### Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/2201020326-ship-it/Breast-cancer.git
   cd "Breast cancer"
   ```

2. **Run the automated setup script**
   ```bash
   .\run.bat
   ```
   
   This script will automatically:
   - Detect or install Python
   - Create a virtual environment (`venv`)
   - Install backend dependencies
   - Install frontend dependencies (npm)
   - Start both backend (port 8000) and frontend (port 5173)
   - Open your browser to the application

### Manual Setup (if needed)

**Backend:**
```bash
# Create virtual environment
python -m venv venv
.\venv\Scripts\activate

# Install dependencies
pip install -r breast_cancer_system/requirements.txt

# Start backend
python -m uvicorn breast_cancer_system.main:app --reload --host 127.0.0.1 --port 8000
```

**Frontend:**
```bash
cd frontend
npm install
npm run dev -- --host 127.0.0.1 --port 5173
```

## 📖 Usage

1. **Open the application** in your browser
   - Frontend: http://127.0.0.1:5173
   - Backend API Docs: http://127.0.0.1:8000/docs

2. **Register/Login**
   - Create a new account or log in with your credentials

3. **Enter Patient Data**
   - Input 30 medical features (CSV/PDF/Image or manual entry)
   - Supported formats: CSV, PDF, Image files

4. **Get Predictions**
   - Receive:
     - Cancer detection prediction
     - Confidence probability (0-100%)
     - Personalized medicine recommendations
     - Risk analysis

5. **Export Reports**
   - Download prediction reports as CSV
   - Persist data for medical records

## 📁 Project Structure

```
Breast cancer/
├── breast_cancer_system/          # Backend application
│   ├── main.py                    # FastAPI app entry point
│   ├── requirements.txt           # Python dependencies
│   ├── routes/                    # API endpoints
│   │   ├── auth.py               # Authentication
│   │   ├── patient.py            # Patient management
│   │   └── prediction.py         # Prediction endpoints
│   ├── services/                  # Business logic
│   │   ├── ml_model.py           # ML inference
│   │   └── medicine_recommendation.py
│   ├── database/                  # Database configuration
│   │   ├── connection.py         # DB connction
│   │   ├── models.py             # SQLAlchemy models
│   │   └── schemas.py            # Pydantic schemas
│   ├── utils/                     # Utilities
│   │   └── security.py           # JWT & password hashing
│   └── tests/                     # Unit tests
│
├── frontend/                      # React/TypeScript frontend
│   ├── src/
│   │   ├── App.tsx               # Main app component
│   │   ├── api.ts                # API client
│   │   └── components/           # React components
│   ├── package.json              # Node dependencies
│   └── vite.config.ts            # Vite configuration
│
├── medicines & drugs/            # Medicine datasets
│   ├── medicine_catalog.json     # Medicine database
│   ├── DS_BreastCancer.csv       # Cancer drug data
│   └── us medicine/              # US pharmacy data
│
├── images/                        # Documentation diagrams
│   ├── system-architecture/      # Architecture diagrams
│   ├── er-diagram-db/            # Database schema
│   ├── functional-workflow/      # Workflow diagrams
│   └── workflow/                 # Process flow
│
├── logs/                          # Application logs
│   └── report_exports/           # Generated reports
│
├── run.bat                        # Automated startup script
├── README.md                      # This file
└── .gitignore                     # Git ignore rules
```

## 🔐 API Endpoints

### Authentication
- `POST /auth/register` - Register new user
- `POST /auth/login` - Login user (returns JWT)

### Patients
- `GET /patients` - List all patients
- `POST /patients` - Create new patient
- `GET /patients/{id}` - Get patient details
- `PUT /patients/{id}` - Update patient info

### Predictions
- `POST /predict` - Get cancer prediction
  - Input: 30 breast cancer features
  - Output: Prediction, probability, medicine recommendations

### Reports
- `GET /reports/{id}/csv` - Download report as CSV
- `POST /reports/export` - Generate bulk export

## 📊 Machine Learning Model

The model is trained on the **Breast Cancer Wisconsin Dataset** with:
- **Features**: 30 numerical features (radius, texture, perimeter, area, smoothness, compactness, concavity, concave points, symmetry, fractal dimension - in mean, standard error, and worst categories)
- **Output**: Binary classification (Malignant/Benign)
- **Accuracy**: >95% on validation set
- **Model File**: `breast_cancer_system/model.pkl`

## 🧪 Testing

Run backend tests:
```bash
cd breast_cancer_system
python -m pytest tests/
```

## 📝 Medicine Recommendation Engine

The system analyzes patient data and recommends appropriate medications based on:
- Cancer severity and probability
- Patient medical history
- Drug efficacy data
- US pharmaceutical database
- NHANES (National Health and Nutrition Examination Survey) data

## 🔄 Development Workflow

1. Make changes to code
2. Backend auto-reloads with `--reload` flag
3. Frontend auto-refreshes with Vite HMR
4. Check API docs at http://127.0.0.1:8000/docs
5. Commit and push to GitHub

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## ⚠️ Disclaimer

**This system is for educational and research purposes only.** It is NOT intended for clinical diagnosis or treatment decisions. Always consult with qualified healthcare professionals for medical advice.

## 📞 Support

For issues, questions, or contributions, please open an issue on GitHub.

---

**Repository**: https://github.com/2201020326-ship-it/Breast-cancer

**Last Updated**: March 2026
