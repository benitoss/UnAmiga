@echo off

set fname_i=nes
set fname_o=NES_multicore_VGA
set fdir=NES

echo Generating Multicore Files
copy .\output_files\%fname_i%.sof "..\..\..\..\..\Multicore_Bitstreams\%fdir%\%fname_o%.sof"
c:\altera\13.0sp1\quartus\bin64\quartus_cpf -s EP4CE10 -d EPCS16 -c .\output_files\%fname_i%.sof "..\..\..\..\..\Multicore_Bitstreams\%fdir%\%fname_o%.jic"
c:\altera\13.0sp1\quartus\bin64\quartus_cpf -c .\output_files\%fname_i%.sof "..\..\..\..\..\Multicore_Bitstreams\%fdir%\%fname_o%.rbf"
pause
