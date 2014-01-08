..\c8080\c8080.exe lines.c sprites.c font.c interface.c music.c
rem sjasmplus test.asm
..\c8080\tasm -gb -b -85 lines.asm lines.rka >errors.txt
if errorlevel 1 goto err
goto end
:err
type errors.txt
pause
:end