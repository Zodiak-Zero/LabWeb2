@echo off

:: Запускаем Gunicorn и сохраняем его PID
start gunicorn --bind 127.0.0.1:5000 wsgi:app
set APP_PID=%ERRORLEVEL%

:: Ожидание 5 секунд
timeout /t 5 /nobreak >nul

:: Выводим PID процесса
echo PID of the Gunicorn process: %APP_PID%

:: Убиваем процесс по PID
taskkill /PID %APP_PID% /F

echo Gunicorn process killed

exit /b 0
