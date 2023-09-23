@echo off
SET LOG_FILE=error.log

REM 将命令保存到临时批处理文件
echo npm run serve > tmp.bat

REM 使用 cmd.exe 执行临时批处理文件
cmd /k tmp.bat

REM 检查命令执行结果
IF %ERRORLEVEL% NEQ 0 (
    echo "出现异常，请查看错误日志：%LOG_FILE%"
    echo "出现异常，请查看错误日志：%LOG_FILE%" >> %LOG_FILE%
    pause
)

REM 如果命令成功执行，删除临时批处理文件和错误日志文件
if exist tmp.bat del tmp.bat
if exist %LOG_FILE% del %LOG_FILE%
