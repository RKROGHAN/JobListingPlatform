@echo off
echo Setting up Job Portal Frontend...
echo.

echo Checking Node.js installation...
node --version
if %errorlevel% neq 0 (
    echo Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo.
echo Checking npm installation...
npm --version
if %errorlevel% neq 0 (
    echo npm is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo.
echo Installing dependencies...
cd frontend
npm install
if %errorlevel% neq 0 (
    echo Failed to install dependencies. Please check the errors above.
    pause
    exit /b 1
)

echo.
echo Starting the development server...
npm start

pause
