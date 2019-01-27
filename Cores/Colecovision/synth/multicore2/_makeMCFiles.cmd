@echo off

set /p version="Enter VGA or HDMI: "

set fname_i=coleco_multicore
set fname_o=coleco_multicore_%version%
set fdir=Colecovision

echo Generating Multicore Files
copy .\output_files\%fname_i%.sof ..\..\..\..\..\Multicore_Bitstreams\%fdir%\%fname_o%.sof
c:\altera\13.0sp1\quartus\bin64\quartus_cpf -s EP4CE10 -d EPCS16 -c .\output_files\%fname_i%.sof ..\..\..\..\..\Multicore_Bitstreams\%fdir%\%fname_o%.jic
c:\altera\13.0sp1\quartus\bin64\quartus_cpf -c .\output_files\%fname_i%.sof ..\..\..\..\..\Multicore_Bitstreams\%fdir%\%fname_o%.rbf
pause
