:: Exports plugin as a .zip file for installation in Kodi
@echo off

:: Zip path
Set zip-path=C:\Program Files\7-Zip
Set "zip=%zip-path%\7z.exe"

:: Kodi addon directory
Set "export-dir=%1"
Set "work-dir=%USERPROFILE%\Code\Source\PhpstormProjects\skin.bello.7"

:: Zip plugin
Set "archive=%export-dir%\skin.bellisimo"
:: Create tmp dir
echo Creating temporary directory...
IF EXIST %archive% (rmdir /S /Q %archive%)
mkdir %archive%
:: Copy files to tmp dir
echo Copying files to tmp dir
XCOPY /e /y "%work-dir%\*" "%archive%"
echo Zipping files...
"%zip%" a -tzip "%archive%.zip" "%archive%"
MOVE "%archive%.zip" "%export-dir%"
:: Remove temp files
echo Removing temporary files...
rmdir /s/q %archive%
echo Done.
