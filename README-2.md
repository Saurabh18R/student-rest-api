
# Student API

A RESTful API for managing student records built with Flask and PostgreSQL.

## Prerequisites

1. Python 3.x
2. PostgreSQL
3. Git (optional, for version control)

## Project Structure

```
student-api/
├── src/
│   ├── __init__.py
│   ├── app.py
│   ├── config.py
│   ├── models.py
│   └── routes.py
├── migrations/
├── tests/
├── .env
├── .gitignore
├── Makefile
├── README.md
└── requirements.txt
```

## Setup Instructions

### 1. Database Setup

1. Install PostgreSQL from [https://www.postgresql.org/download/windows/](https://www.postgresql.org/download/windows/)
2. During installation:
   - Note down the password you set for the postgres user
   - Keep the default port (5432)
3. Open pgAdmin 4 (comes with PostgreSQL)
4. Create a new database:
   - Right-click on "Databases"
   - Select "Create" → "Database"
   - Name: `student_db`
   - Owner: `postgres`
   - Click "Save"

### 2. Application Setup

1. Clone the repository (if using Git):
   ```bash
   git clone <repository-url>
   cd student-api
   ```

2. Create and activate virtual environment:
   ```bash
   # Create virtual environment
   python -m venv venv

   # Activate virtual environment
   # On Windows (PowerShell):
   .\venv\Scripts\activate
   # On Windows (Git Bash):
   source venv/Scripts/activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Configure environment variables:
   - Create/update `.env` file with:
   ```
   DATABASE_URL=postgresql://postgres:your_password@localhost:5432/student_db
   FLASK_ENV=development
   ```
   Replace `your_password` with the password you set during PostgreSQL installation.

5. Initialize the database:
   ```bash
   python init_db.py
   ```

## Running the Application

1. Set Python path (required for imports):
   ```bash
   # On Windows (PowerShell):
   $env:PYTHONPATH = "."
   ```

2. Start the Flask server:
   ```bash
   python src/app.py
   ```

The application will be available at `http://localhost:5000`

## API Endpoints

### 1. Health Check
- **URL**: `/api/healthcheck`
- **Method**: GET
- **Response**: `{"status": "healthy"}`

### 2. Create Student
- **URL**: `/api/v1/students`
- **Method**: POST
- **Headers**: 
  ```
  Content-Type: application/json
  ```
- **Body**:
  ```json
  {
      "name": "John Doe",
      "email": "john@example.com"
  }
  ```

### 3. Get All Students
- **URL**: `/api/v1/students`
- **Method**: GET
- **Response**: Array of student objects

### 4. Get Single Student
- **URL**: `/api/v1/students/<id>`
- **Method**: GET
- **Response**: Single student object

### 5. Update Student
- **URL**: `/api/v1/students/<id>`
- **Method**: PUT
- **Headers**:
  ```
  Content-Type: application/json
  ```
- **Body**:
  ```json
  {
      "name": "John Updated",
      "email": "john.updated@example.com"
  }
  ```

### 6. Delete Student
- **URL**: `/api/v1/students/<id>`
- **Method**: DELETE

## Testing the API

### Using Postman

1. Download and install [Postman](https://www.postman.com/downloads/)
2. Create a new request:
   - Click "New" → "HTTP Request"
   - Set the URL and method as per the endpoint
   - For POST/PUT requests:
     - Set Headers: `Content-Type: application/json`
     - Set Body: raw JSON with required data
   - Click "Send"

### Using Browser
- GET requests can be tested directly in the browser
- Visit `http://localhost:5000/api/v1/students` to see all students
- Visit `http://localhost:5000/api/healthcheck` to check API health

### Using curl (PowerShell)
```powershell
# Create student
$headers = @{ "Content-Type" = "application/json" }
$body = '{"name": "John Doe", "email": "john@example.com"}'
Invoke-WebRequest -Uri "http://localhost:5000/api/v1/students" -Method Post -Headers $headers -Body $body

# Get all students
Invoke-WebRequest -Uri "http://localhost:5000/api/v1/students" -Method Get

# Get single student
Invoke-WebRequest -Uri "http://localhost:5000/api/v1/students/1" -Method Get

# Update student
$body = '{"name": "John Updated", "email": "john.updated@example.com"}'
Invoke-WebRequest -Uri "http://localhost:5000/api/v1/students/1" -Method Put -Headers $headers -Body $body

# Delete student
Invoke-WebRequest -Uri "http://localhost:5000/api/v1/students/1" -Method Delete
```

## Troubleshooting

1. **Database Connection Issues**:
   - Verify PostgreSQL is running
   - Check database credentials in `.env`
   - Ensure `student_db` exists

2. **Import Errors**:
   - Make sure PYTHONPATH is set
   - Verify virtual environment is activated
   - Check all dependencies are installed

3. **Server Not Starting**:
   - Check if port 5000 is available
   - Verify all environment variables are set
   - Check logs for specific error messages

## Development

- The application uses Flask's debug mode for development
- Logs are printed to the console
- Database migrations are handled through Flask-Migrate
- The application follows RESTful API best practices