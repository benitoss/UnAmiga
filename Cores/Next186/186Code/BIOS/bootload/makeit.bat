@echo off

    if exist "a.obj" del "a.obj"
    if exist "a.com" del "a.com"

    \masm32\bin\ml /AT /c /Fl /Zm a.asm
    if errorlevel 1 goto errasm

    \masm32\bin\link16 /TINY a,a.com,,,,
    if errorlevel 1 goto errlink
    dir "a.*"
    goto TheEnd

  :errlink
    echo _
    echo Link error
    goto TheEnd

  :errasm
    echo _
    echo Assembly Error
    goto TheEnd
    
  :TheEnd

pause
