@echo off
echo Setting up Job Portal Backend...
echo.

echo Checking Java installation...
java -version
if %errorlevel% neq 0 (
    echo Java is not installed or not in PATH
    echo Please install Java 17 or higher from https://adoptium.net/
    pause
    exit /b 1
)

echo.
echo Checking Maven installation...
mvn -version
if %errorlevel% neq 0 (
    echo Maven is not installed or not in PATH
    echo Please install Maven from https://maven.apache.org/download.cgi
    pause
    exit /b 1
)

echo.
echo Building the project...
cd backend
mvn clean install
if %errorlevel% neq 0 (
    echo Build failed. Please check the errors above.
    pause
    exit /b 1
)

echo.
echo Starting the application...
mvn spring-boot:run

pause
