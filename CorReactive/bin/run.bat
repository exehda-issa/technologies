@echo off
REM set JAVA_HOME=C:\Program Files\Java\jre1.8.0_31
if "%JAVA_HOME%" == "" (
  echo.
  echo JAVA_HOME not set
  goto EOF
)

if not exist "%JAVA_HOME%\bin\java.exe" (
  echo.
  echo Cannot find java executable, check JAVA_HOME
  goto EOF
)

set SCRIPT_DIR=%~dp0
for %%I in ("%SCRIPT_DIR%..") do set CR_HOME=%%~dpfI

set MEMORY_OPTIONS=-Xms256m -Xmx1g
cd %CR_HOME%\bin

"%JAVA_HOME%/bin/java" -cp %CR_HOME%/lib/*; %MEMORY_OPTIONS% -Dlog4j.configuration=log4j.xml com.ksoft.cengine.core.Launcher

:EOF