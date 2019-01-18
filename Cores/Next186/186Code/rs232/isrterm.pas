program ISRTerminal;
 uses
   Crt, Dos;
 const
   {UART Constants}
   THR = 0;
   RBR = 0;
   IER = 1;
   FCR = 2;
   LCR = 3;
   MCR = 4;
   LSR = 5;
   Latch_Low = $00;
   Latch_High = $01;
   {PIC Constants}
   MasterPIC = $20;
   MasterOCW1 = $21;
   {Character Constants}
   NullLetter = #0;
   EscapeKey = #27;
 var
   ComPort: array [1..4] of Word absolute $0040:$0000;
   OldSerialVector: procedure;
   OutputLetter: Char;
 {$F+}
 procedure SerialDataIn; interrupt;
 var
   InputLetter: Char;
 begin     
   if (Port[ComPort[1] + LSR] and $01) > 0 then begin
     InputLetter := Chr(Port[ComPort[1] + RBR]);
     Write(InputLetter);
   end; {if}
   Port[MasterPIC] := EOI;
 end;
 {$F-}
 begin
   Writeln('Simple Serial ISR Data Terminal Program.  Press "Esc" to quit.');
   {Change UART Settings}
   Port[ComPort[1] + LCR] := $80;
   Port[ComPort[1] + Latch_High] := $00;
   Port[ComPort[1] + Latch_Low] := $0C;
   Port[ComPort[1] + LCR] := $03;
   Port[ComPort[1] + FCR] := $07; {clearing the FIFOs}
   Port[ComPort[1] + FCR] := $00; {disabling FIFOs}
   Port[ComPort[1] + MCR] := $0B;
   {Setup ISR vectors}
   GetIntVec($0C,@OldSerialVector);
   SetIntVec($0C,Addr(SerialDataIn));
   Port[MasterOCW1] := Port[MasterOCW1] and $EF;
   Port[ComPort[1] + IER] := $01;
   {Scan for keyboard data}
   OutputLetter := NullLetter;
   repeat
     if KeyPressed then begin
       OutputLetter := ReadKey;
       Port[ComPort[1] + THR] := Ord(OutputLetter); 
     end; {if}
   until OutputLetter = EscapeKey;
   {Put the old ISR vector back in}
   SetIntVec($0C,@OldSerialVector);
   Port[MasterOCW1] := Port[MasterOCW1] or $10;
 end.
