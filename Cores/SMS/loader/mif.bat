
srec_cat --Output boot.mif -Memory_Initialization_File 8 boot.sms --Binary
copy boot.mif ..\src /Y
pause