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

## ⚙️ Environment Variables

Create a `.env` file in the project root with the following variables:

### Backend (.env)
```env
# Database
DATABASE_URL=sqlite:///./test-live.db
# Or for MySQL: mysql+pymysql://user:password@localhost/breast_cancer_db

# JWT
SECRET_KEY=your-secret-key-change-this-in-production
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30

# Server
BACKEND_HOST=127.0.0.1
BACKEND_PORT=8000

# CORS
FRONTEND_URL=http://127.0.0.1:5173
```

### Frontend (.env in `frontend/` folder)
```env
VITE_API_URL=http://127.0.0.1:8000
VITE_APP_NAME=Breast Cancer Detection System
```

## 🔧 Troubleshooting

### Issue: "Python was not found"
**Solution:**
- Ensure Python 3.10+ is installed
- Check PATH environment variable includes Python
- Run `where python` in terminal
- If needed, reinstall Python from python.org

### Issue: Virtual environment not activating
**Solution:**
```bash
# Manually create and activate
python -m venv venv
.\venv\Scripts\activate  # Windows
source venv/bin/activate  # Mac/Linux
```

### Issue: "No module named 'breast_cancer_system'"
**Solution:**
```bash
# Ensure you're in the project root directory
# Re-install dependencies
pip install -r breast_cancer_system/requirements.txt
```

### Issue: Backend fails to start on port 8000
**Solution:**
```bash
# Check if port is in use
netstat -ano | findstr :8000

# Kill process on that port (Windows)
taskkill /PID <PID> /F

# Or run on different port
python -m uvicorn breast_cancer_system.main:app --reload --host 127.0.0.1 --port 8001
```

### Issue: Frontend won't connect to backend
**Solution:**
- Verify backend is running: http://127.0.0.1:8000/docs
- Check CORS settings in `breast_cancer_system/main.py`
- Ensure `FRONTEND_URL` in `.env` matches your frontend URL
- Check browser console for specific errors

### Issue: Database errors
**Solution:**
```bash
# SQLite (default)
# Delete existing database to reset
rm test-live.db

# For MySQL
# Verify connection string: DATABASE_URL=mysql+pymysql://user:password@host/dbname
# Ensure MySQL server is running
```

### Issue: npm install fails
**Solution:**
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules
rm -r frontend/node_modules

# Reinstall
cd frontend && npm install
```

## ❓ FAQ

**Q: Can I use this for clinical diagnosis?**
A: No. This is for research/educational purposes only. Always consult healthcare professionals.

**Q: What medical features does the model use?**
A: 30 numerical features including radius, texture, perimeter, area, smoothness, compactness, concavity, symmetry, and fractal dimension measurements.

**Q: How accurate is the model?**
A: >95% accuracy on the Wisconsin Breast Cancer dataset. Performance may vary with different data.

**Q: Can I train the model on my own data?**
A: Yes. Modify `ml_model.py` to load your training data and retrain the model.

**Q: Is the application secure?**
A: JWT authentication is implemented. For production, use HTTPS, secure SECRET_KEY, and review security best practices.

**Q: How do I export reports?**
A: After making a prediction, click the "Download Report" button or use the `/reports/{id}/csv` API endpoint.

**Q: Can I modify the medicine recommendations?**
A: Yes. Edit `breast_cancer_system/services/medicine_recommendation.py` and update the recommendation logic.

**Q: What database should I use for production?**
A: MySQL or PostgreSQL. Update `DATABASE_URL` in `.env` to use production database.

## 📊 Usage Examples

### Example 1: Register & Login
```bash
# Register
curl -X POST "http://127.0.0.1:8000/auth/register" \
  -H "Content-Type: application/json" \
  -d '{"email": "user@example.com", "password": "password123", "name": "John Doe"}'

# Login
curl -X POST "http://127.0.0.1:8000/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"email": "user@example.com", "password": "password123"}'
```

### Example 2: Make a Prediction
```bash
curl -X POST "http://127.0.0.1:8000/predict" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "features": [17.99, 10.38, 122.80, 1001.0, 0.1184, 0.2776, 0.3001, 0.1471, 0.2419, 0.0787, 1.0950, 1.1040, 8.589, 153.4, 0.0064, 0.0049, 0.0054, 0.0037, 0.0091, 0.0063, 25.38, 17.16, 184.6, 2019.0, 0.1622, 0.6656, 0.7119, 0.2654, 0.4601, 0.1189]
  }'
```

### Example 3: Get Patient History
```bash
curl -X GET "http://127.0.0.1:8000/patients/1" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

## 🚀 Deployment

### Deploy Backend to Heroku
```bash
# Install Heroku CLI, then:
heroku create your-app-name
heroku addons:create cleardb:ignite  # Database
git push heroku main
```

### Deploy Frontend to Vercel
```bash
# Install Vercel CLI
npm i -g vercel

cd frontend
vercel
# Follow prompts, set VITE_API_URL environment variable
```

### Deploy with Docker
```bash
# Build image
docker build -t breast-cancer-app .

# Run container
docker run -p 8000:8000 -p 5173:5173 breast-cancer-app
```

## 📈 Performance Optimization

- Use database indexing on frequently queried columns
- Implement caching for medicine recommendations
- Optimize frontend bundle size with tree-shaking
- Use CDN for static assets
- Consider model quantization for faster inference
- Enable GZIP compression on backend

## 🔒 Security Checklist

- [ ] Change `SECRET_KEY` for production
- [ ] Use HTTPS in production
- [ ] Implement rate limiting
- [ ] Add CORS restrictions
- [ ] Hash sensitive data
- [ ] Use environment variables for secrets
- [ ] Implement SQL injection prevention
- [ ] Add input validation
- [ ] Regular security audits
- [ ] Keep dependencies updated

## 📞 Support

For issues, questions, or contributions, please:
1. Check the [Troubleshooting](#-troubleshooting) section
2. Review the [FAQ](#-faq)
3. Open an issue on GitHub

---

**Repository**: https://github.com/2201020326-ship-it/Breast-cancer

**Documentation**: See [images/](images/) folder for architecture diagrams

**Last Updated**: March 31, 2026
