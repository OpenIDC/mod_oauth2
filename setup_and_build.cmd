
rem It is assumed that this directory has the same root directory as liboauth
cd ..
cd liboauth2
call "bootstrap-windows.cmd"
cd ..
cd mod_oauth2

msbuild.exe "mod_oauth2.sln" /p:Configuration=Release /p:Platform="x64"

mkdir target
mkdir target\mod_oauth2
mkdir target\mod_oauth2\x64
mkdir target\mod_oauth2\x64\Release
copy x64\Release\mod_oauth2.dll target\mod_oauth2\x64\Release\mod_oauth2.dll

del target\mod_oauth2-3.2.0-win64-VS16.zip

powershell Compress-Archive -Path target\mod_oauth2\x64\Release\mod_oauth2.dll -DestinationPath target\mod_oauth2-3.2.0-win64-VS16.zip
