@echo off
call :MAIN %*
exit

:MAIN
setlocal
  call ..\c-plus-plus.conf.bat
  if {%1}=={} (
    for %%s in (*.sref) do call :RUN_TEST %%s
  ) else (
    for %%s in (%*) do call :RUN_TEST %%s
  )
endlocal
goto :EOF

:RUN_TEST
setlocal
  echo Passing %1...
  set SREF=%1
  set CPP=%~n1.cpp
  set EXE=%~n1.exe

  ..\compiler\srefc %1 2> __error.txt
  if errorlevel 1 (
    echo COMPILER ON %1 FAILS, SEE __error.txt
    exit
  )
  erase __error.txt
  if not exist %CPP% (
    echo COMPILATION FAILED
    exit
  )

  %CPPLINE% -I../srlib -DDUMP_FILE=\"dump.txt\" -DDONT_PRINT_STATISTICS %CPP% ../srlib/refalrts.cpp
  if errorlevel 1 (
    echo COMPILATION FAILED
    exit
  )
  if exist a.exe move a.exe %EXE%

  %EXE%
  if errorlevel 1 (
    echo TEST FAILED, SEE dump.txt
    exit
  )

  erase %CPP% %EXE%
  if exist *.obj erase *.obj
  if exist *.tds erase *.tds
  if exist dump.txt erase dump.txt
  echo.
endlocal
goto :EOF