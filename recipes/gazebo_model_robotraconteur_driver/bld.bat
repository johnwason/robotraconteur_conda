@echo off

dotnet publish GazeboModelRobotRaconteurDriver.csproj --self-contained false -c Release -o %LIBRARY_PREFIX%\opt\gazebo_model_robotraconteur_driver
if %errorlevel% neq 0 exit /b %errorlevel%
cp %RECIPE_DIR%\gazebo_model_robotraconteur_driver.bat %LIBRARY_PREFIX%\bin\
if %errorlevel% neq 0 exit /b %errorlevel%