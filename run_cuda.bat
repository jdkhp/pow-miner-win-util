@echo off

for /F "tokens=*" %%I in (run_config.ini) do set %%I

set "LOG="
if "%USE_LOG%"=="Y" (
  set "LOG=2>&1 >> %LOG_FILE%"
)

echo on
:_minerstart
tonlib-cuda-cli.exe -V
tonlib-cuda-cli.exe -v 3 -C %CONFIG_FILE% -e "pminer start %GIVER_ADDR% %MY_ADDR% %GPU_ID% %BOOST_FACTOR%" %LOG%
goto _minerstart
