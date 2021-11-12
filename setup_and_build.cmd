
@ECHO Checking for VS2019 Enterprise
if "%VSINSTALLDIR%"=="" call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsx86_amd64.bat"

@ECHO Checking for VS2019 Professional
if "%VSINSTALLDIR%"=="" call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvarsx86_amd64.bat"

SET BASE_DIR=%cd%
set VCPKG_HOME=%BASE_DIR%/vcpkg
mkdir "%VCPKG_HOME%"

@ECHO -------------------------------------------
@echo BASE_DIR   = %BASE_DIR%
@echo VCPKG_HOME = %VCPKG_HOME%
@ECHO -------------------------------------------

cd %BASE_DIR%/../liboauth2

call "bootstrap-windows.cmd"


cd %BASE_DIR%

msbuild.exe "mod_oauth2.sln" /p:Configuration=Release /p:Platform="x64"

mkdir target
mkdir target\mod_oauth2
mkdir target\mod_oauth2\x64
mkdir target\mod_oauth2\x64\Release
copy x64\Release\mod_oauth2.dll target\mod_oauth2\x64\Release\mod_oauth2.dll

del target\mod_oauth2-3.2.2-win64-VS16.zip

powershell Compress-Archive -Path target\mod_oauth2\x64\Release\mod_oauth2.dll -DestinationPath target\mod_oauth2-3.2.2-win64-VS16.zip

%VCPKG_CMD% integrate remove 