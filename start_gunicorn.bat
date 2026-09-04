@echo off
REM Start SIAR Platform with Gunicorn
REM Production deployment script for Windows

echo.
echo ================================================================
echo  SIAR PLATFORM v4.5 - GUNICORN PRODUCTION LAUNCHER
echo ================================================================
echo.

REM Check if gunicorn is installed
python -m pip show gunicorn >nul 2>&1
if errorlevel 1 (
    echo Installing gunicorn...
    pip install gunicorn
)

REM Create logs directory if it doesn't exist
if not exist "logs" mkdir logs

REM Install all requirements
echo.
echo Installing dependencies from requirements.txt...
pip install -r requirements.txt

REM Start gunicorn
echo.
echo ================================================================
echo  Starting SIAR Platform with Gunicorn...
echo ================================================================
echo.
echo Server running at: http://0.0.0.0:5000
echo.
echo Access the platform:
echo   - Local: http://localhost:5000
echo   - Network: http://YOUR_IP:5000
echo.
echo Logs: logs/gunicorn_access.log, logs/gunicorn_error.log
echo.
echo Press Ctrl+C to stop the server
echo ================================================================
echo.

gunicorn -c gunicorn_config.py complete_platform_final:app

pause
