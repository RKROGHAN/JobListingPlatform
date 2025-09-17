@echo off
echo ========================================
echo    Job Portal System - Quick Start
echo ========================================
echo.

echo This script will help you run the Job Portal System
echo.

echo Step 1: Check Prerequisites
echo ---------------------------
echo.

echo Checking Java...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java is not installed or not in PATH
    echo    Please install Java 17+ from: https://adoptium.net/
    goto :end
) else (
    echo ✅ Java is installed
)

echo.
echo Checking Maven...
mvn -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Maven is not installed or not in PATH
    echo    Please install Maven from: https://maven.apache.org/download.cgi
    goto :end
) else (
    echo ✅ Maven is installed
)

echo.
echo Checking Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo    Please install Node.js from: https://nodejs.org/
    goto :end
) else (
    echo ✅ Node.js is installed
)

echo.
echo Checking npm...
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed or not in PATH
    echo    Please install Node.js from: https://nodejs.org/
    goto :end
) else (
    echo ✅ npm is installed
)

echo.
echo ========================================
echo All prerequisites are installed!
echo ========================================
echo.

echo Step 2: Database Setup
echo ----------------------
echo Please make sure you have:
echo 1. MySQL installed and running
echo 2. Created a database named 'job_portal_db'
echo 3. Updated database credentials in backend/src/main/resources/application.yml
echo 4. Run the setup-database.sql script to create initial data
echo.

set /p continue="Have you set up the database? (y/n): "
if /i not "%continue%"=="y" (
    echo Please set up the database first and then run this script again.
    goto :end
)

echo.
echo Step 3: Starting the Application
echo --------------------------------
echo.

echo Starting Backend Server...
echo This will open in a new window...
start "Job Portal Backend" cmd /k "cd backend && mvn spring-boot:run"

echo.
echo Waiting 10 seconds for backend to start...
timeout /t 10 /nobreak >nul

echo.
echo Starting Frontend Server...
echo This will open in a new window...
start "Job Portal Frontend" cmd /k "cd frontend && npm start"

echo.
echo ========================================
echo    Application Started Successfully!
echo ========================================
echo.
echo Backend API: http://localhost:8080
echo Frontend UI: http://localhost:3000
echo API Docs: http://localhost:8080/swagger-ui.html
echo.
echo Default Login Credentials:
echo - Admin: admin@jobportal.com / admin123
echo - Job Seeker: john.doe@email.com / user123
echo - Employer: jane.smith@company.com / employer123
echo.

:end
echo.
pause
