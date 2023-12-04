@ECHO off
color 01
echo :::::::::::::::::::::::::::::::::::::::
echo ::::::::::  FLUTTER CLEAN  ::::::::::::
echo :::::::::::::::::::::::::::::::::::::::
call flutter clean
color 0A
echo :::::::::::::::::::::::::::::::::::::::
echo :::::::::  FLUTTER PUB GET  :::::::::::
echo :::::::::::::::::::::::::::::::::::::::
color 03
call  flutter pub get
echo :::::::::::::::::::::::::::::::::::::::
echo :::::::::  FLUTTER BUILD  :::::::::::::
echo :::::::::::::::::::::::::::::::::::::::
 call dart run build_runner build --delete-conflicting-outputs
 color 0A
pause



