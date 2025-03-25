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

### Health Check
- **GET** `/api/v1/health`
  - Returns the health status of the API
  - Response: `{"status": "healthy"}`

### Students
- **GET** `/api/v1/students`
  - Returns a list of all students
  - Response: Array of student objects

- **POST** `/api/v1/students`
  - Creates a new student
  - Request body:
    ```json
    {
      "name": "John Doe",
      "age": 20,
      "grade": "A"
    }
    ```
  - Response: Created student object

- **GET** `/api/v1/students/<id>`
  - Returns a specific student by ID
  - Response: Student object

- **PUT** `/api/v1/students/<id>`
  - Updates a specific student
  - Request body: Updated student data
  - Response: Updated student object

- **DELETE** `/api/v1/students/<id>`
  - Deletes a specific student
  - Response: Success message

## Testing the API

### Using Postman

1. Download and install [Postman](https://www.postman.com/downloads/)
2. Create a new request:
   - Method: POST
   - URL: `http://localhost:5000/api/v1/students`
   - Headers: 
     - Key: `Content-Type`
     - Value: `application/json`
   - Body (raw JSON):
     ```json
     {
       "name": "John Doe",
       "age": 20,
       "grade": "A"
     }
     ```
3. Click "Send" to create a student

### Using PowerShell

```powershell
# Create a student
$body = @{
    name = "John Doe"
    age = 20
    grade = "A"
} | ConvertTo-Json

Invoke-WebRequest -Uri "http://localhost:5000/api/v1/students" -Method Post -Body $body -ContentType "application/json"

# Get all students
Invoke-WebRequest -Uri "http://localhost:5000/api/v1/students" -Method Get
```

## Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Verify PostgreSQL is running
   - Check database credentials in `.env`
   - Ensure database exists

2. **Import Errors**
   - Verify PYTHONPATH is set
   - Check virtual environment is activated
   - Verify all dependencies are installed

3. **Port Already in Use**
   - Check if another process is using port 5000
   - Use a different port by setting `FLASK_RUN_PORT` in `.env`

### Getting Help

If you encounter issues:
1. Check the error message in the terminal
2. Verify all setup steps are completed
3. Check the logs for detailed error information
4. Create an issue in the repository

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 