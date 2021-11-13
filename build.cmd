call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

msbuild.exe "mod_oauth2.sln" /p:Configuration=Release /p:Platform="x64"

mkdir target
mkdir target\mod_oauth2
mkdir target\mod_oauth2\x64
mkdir target\mod_oauth2\x64\Release
copy x64\Release\mod_oauth2.dll target\mod_oauth2\x64\Release\mod_oauth2.dll

del target\mod_oauth2-3.2.2-win64-VS16.zip

powershell Compress-Archive -Path target\mod_oauth2\x64\Release\mod_oauth2.dll -DestinationPath target\mod_oauth2-3.2.2-win64-VS16.zip
