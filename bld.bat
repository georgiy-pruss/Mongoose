@echo off
if "%VCINSTALLDIR%"=="" call C:\VS2010\VC\vcvarsall.bat
if exist mongoose.exe del mongoose.exe mongoose.obj web_server.obj
set opts=/D WIN32 /D NDEBUG /D _WINDOWS /D _UNICODE /D UNICODE /Zc:wchar_t /TC /MD
cl /nologo /O2 /DMONGOOSE_NO_DAV /DMONGOOSE_NO_AUTH %opts% /c web_server.c mongoose.c
link /nologo /subsystem:windows mongoose.obj web_server.obj user32.lib /out:mongoose.exe
if exist mongoose.exe del mongoose.obj web_server.obj
