program SimpleTerminal;
uses
  Crt;
const
  THR = 0;
  RBR = 0;
  LCR = 3;
  LSR = 5;
  Latch_Low = $00;
  Latch_High = $01;
  {Character Constants}
  NullLetter = #0;
  EscapeKey = #27;
var
  ComPort: array [1..4] of Word absolute $0040:$0000;
  InputLetter: Char;
  OutputLetter: Char;
begin
  Writeln('Simple Serial Data Terminal Program.  Press "Esc" to quit.');
  {Change UART Settings}
  Port[ComPort[1] + LCR] := $80;
  Port[ComPort[1] + Latch_High] := $00;
  Port[ComPort[1] + Latch_Low] := $0C;
  Port[ComPort[1] + LCR] := $03;
  {Scan for serial data}
  OutputLetter := NullLetter;
  repeat
    if (Port[ComPort[1] + LSR] and $01) > 0 then begin
      InputLetter := Chr(Port[ComPort[1] + RBR]);
      Write(InputLetter);
    end; {if}
    if KeyPressed then begin
      OutputLetter := ReadKey;
      Port[ComPort[1] + THR] := Ord(OutputLetter); 
    end; {if}
  until OutputLetter = EscapeKey;
end.