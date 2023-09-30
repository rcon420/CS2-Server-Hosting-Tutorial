@echo off
color 6
mkdir "./game/csgo/logs/%date:~-10,2%-%date:~-7,2%-%date:~-4,4%"
goto reload
:reload
cls
echo Starting Counter-Strike: 2 Server...
start /wait game\bin\win64\cs2.exe -dedicated -usercon -console -maxplayers 32 -condebug +mapgroup mg_oli +map cs_italy +servercfgfile serverconfig_oli.cfg +game_alias casual
cd "./game/csgo_mods"
COPY "console.log" "../csgo/logs/%date:~-10,2%-%date:~-7,2%-%date:~-4,4%/logs_%time:~0,2%-%time:~3,2%-%time:~6,2%.log"
cd ../../
cls
echo The server has crashed. Creating log file and rebooting...
echo Logs are now located in "game/csgo/logs" folder
timeout 5
goto reload