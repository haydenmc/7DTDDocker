@ECHO OFF

REM run update
steamcmd.exe +login anonymous +app_update 294420 validate +quit
steamcmd.exe +login anonymous +app_update 294420 validate +quit

REM Put config files in the right place
pushd "steamapps\common\7 Days to Die Dedicated Server"
if not exist "C:\_data\" mkdir C:\_data
for %%f in (*.xml) do (
    if not exist "C:\_data\%%~nxf" (
        echo "Moving %%~ff to C:\_data and replacing with symlink..."
        move /y "%%~ff" "C:\_data\%%~nxf"
        mklink "%%~ff" "C:\_data\%%~nxf"
    ) ELSE (
        echo "%%~ff already exists on volume - re-linking"
        del /Q /F "%%~ff"
        mklink "%%~ff" "C:\_data\%%~nxf"
    )
)

REM Start up the server
7DaysToDieServer.exe %*