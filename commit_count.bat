@echo off
setlocal enabledelayedexpansion
set "tempfile=%TEMP%\git_authors.txt"
git log --pretty=format:"%%an" > %tempfile%

for /f "tokens=*" %%A in ('sort %tempfile%') do (
    set /a count[%%A]+=1
)

for /f "tokens=2,3 delims=[] " %%A in ('set count[') do (
    echo %%A %%B
)

del %tempfile%
endlocal

