@echo off

cd %~dp0

rem ログフォルダ/ファイル名を生成
if not exist .log (mkdir .log)
set YMD=%date:~0,4%%date:~5,2%%date:~8,2%
set LOGFILE=.log\%~n0_%YMD%.log


echo 勤怠入力を実行します。中止する場合はウィンドウを閉じてください。
timeout 5


call npm run enavi -- workStart getTimes logout -s -e %USERNAME% >>%LOGFILE%
type %LOGFILE%


pause
exit /b %ecode%
