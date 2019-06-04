
#define TDOMASK 0x80   
#define TDOHIGH 0x00   
#define TDI 0x40   
#define TMS 0x02   
#define TCK 0x01   
#define JTAG_ENABLE 0x00   
// Cyclone: IR length = 10   
#define IR_SAMPLE_PRELOAD 0x005   
#define IR_IDCODE 0x006   
#define IR_READ_USERCODE 0x007   
#define IR_HIGHZ 0x00B   
#define IR_BYPASS 0x3FF  

#define IDCODE_MANUF_ALTERA 0x6E   
#define IDCODE_MANUF_ALTERA_FAMILY_CYCLONE 0x10  

#define MaxIR_ChainLength 100


int IRlen = 0;
int nDevices = 0;

struct codestr  
{    
  unsigned char onebit:1;     
  unsigned int manuf:11; 
  unsigned int size:9;  
  unsigned char family:7; 
  unsigned char rev:4; 
};

union 
{
    unsigned long code = 0;
    codestr b;
} idcode;


void JTAG_clock()  
{
 //   digitalWrite(TCKpin, LOW); 
    digitalWrite(TCKpin, HIGH);  
    digitalWrite(TCKpin, LOW);
}

void JTAG_reset()   
{   
    int i;   
    
    digitalWrite(TMSpin, HIGH);
          
    // go to reset state   
    for(i=0; i<10; i++) 
    {
       JTAG_clock();   
    }
}

void JTAG_EnterSelectDR()   
{ 
    // go to select DR   
    digitalWrite(TMSpin, LOW); JTAG_clock();   
    digitalWrite(TMSpin, HIGH); JTAG_clock();  
}  

void JTAG_EnterShiftIR()   
{   
  digitalWrite(TMSpin, HIGH); JTAG_clock();
  digitalWrite(TMSpin, LOW); JTAG_clock();
  digitalWrite(TMSpin, LOW); JTAG_clock();
     
} 

void JTAG_EnterShiftDR()   
{   
    digitalWrite(TMSpin, LOW); JTAG_clock();
    digitalWrite(TMSpin, LOW); JTAG_clock();   

   // digitalWrite(TMSpin, LOW); JTAG_clock(); //extra ?
} 

void JTAG_ExitShift()   
{   
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    digitalWrite(TMSpin, HIGH); JTAG_clock();   
}   

void JTAG_ReadDR(int bitlength)   
{   
    JTAG_EnterShiftDR();   
    JTAG_ReadData(bitlength);   
}  


void JTAG_ReadData(int bitlength)   
// note: call this function only when in shift-IR or shift-DR state   
{   
    int bitofs = 0;

    unsigned long temp;
  
     
    bitlength--;   
    while(bitlength--)   
    {   
        digitalWrite(TCKpin, HIGH);

        temp = digitalRead(TDOpin);


       // Serial.println(temp, HEX); 
        
        temp = temp << bitofs ;
        idcode.code |= temp;
        
        digitalWrite(TCKpin, LOW);  
        bitofs++;   

        
    }  

    digitalWrite(TMSpin, HIGH);
    digitalWrite(TCKpin, HIGH);
 
    temp = digitalRead(TDOpin);

   // Serial.println(temp, HEX); 
    
    temp = temp << bitofs ;
    idcode.code |= temp;
        
    digitalWrite(TCKpin, LOW); 
     
    digitalWrite(TMSpin, HIGH); JTAG_clock();   
    digitalWrite(TMSpin, HIGH); JTAG_clock();  // go back to select-DR   
}

int JTAG_DetermineChainLength(const char* s)   
{   
    int i; 
  // Serial.println("JTAG_DetermineChainLength"); 

    
   
    // empty the chain (fill it with 0's)
    digitalWrite(TDIpin, LOW);   
    for(i=0; i<MaxIR_ChainLength; i++) { digitalWrite(TMSpin, LOW); JTAG_clock();   }
    
    digitalWrite(TCKpin, LOW);
         
    // feed the chain with 1's   
    digitalWrite(TDIpin, HIGH);
    for(i=0; i<MaxIR_ChainLength; i++) 
    { 
 
  
      digitalWrite(TCKpin, HIGH);

       if(digitalRead(TDOpin) == HIGH) break;  
        
           digitalWrite(TCKpin, LOW);
    }
   
      digitalWrite(TCKpin, LOW);

   
         Serial.print(s); 
         Serial.print(" = ");  
         Serial.println(i); 
      
      
    JTAG_ExitShift();   
    return i;   
} 

int JTAG_scan()
{
 int i=0;

  JTAG_reset();  
  JTAG_EnterSelectDR();
  JTAG_EnterShiftIR() ;  

  IRlen = JTAG_DetermineChainLength("tamanho do IR");   

  JTAG_EnterShiftDR();   
  nDevices = JTAG_DetermineChainLength("Qtd devices");  

  if (IRlen == MaxIR_ChainLength || nDevices == MaxIR_ChainLength )
  {
    error();
    return 1;
  }

  // read the IDCODEs (assume all devices support IDCODE, so read 32 bits per device)   
    JTAG_reset();   
    JTAG_EnterSelectDR();
    JTAG_ReadDR(32*nDevices); 

    for(i=0; i<nDevices; i++)   
    {   
       // assert(idcode[i].onebit);  // if the bit is zero, that means IDCODE is not supported for this device   
       // printf("Device %d IDCODE: %08X (Manuf %03X, Part size %03X, Family code %02X, Rev %X)\n", i+1, idcode[i], idcode[i].manuf, idcode[i].size, idcode[i].family, idcode[i].rev);   

      
          Serial.print("Device IDCODE: ");
          
          Serial.println(idcode.code, HEX); 
          
          Serial.print(" rev: ");
          Serial.print(idcode.b.rev, HEX);
          
          Serial.print(" family: ");
          Serial.print(idcode.b.family, HEX); 
          
          Serial.print(" size: ");
          Serial.print(idcode.b.size, HEX); 
          
          Serial.print(" manuf: ");
          Serial.print(idcode.b.manuf, HEX); 
          
          Serial.print(" onebit: ");
          Serial.println(idcode.b.onebit, HEX); 
       
    }  

    return 0;

}

void JTAG_PREprogram()
{
    int n;
    
    JTAG_reset();  
    JTAG_EnterSelectDR();
    JTAG_EnterShiftIR() ;  

      //  digitalWrite(TMSpin, LOW); JTAG_clock(); //extra ?

    // aqui o TMS jÃ¡ esta baixo, nao precisa de outro comando pra abaixar.

    // IR = PROGRAM =   00 0000 0010    // IR = CONFIG_IO = 00 0000 1101
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, HIGH); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();

    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    
    digitalWrite(TDIpin, LOW); JTAG_clock();
                        
    digitalWrite(TDIpin, LOW);   
    digitalWrite(TMSpin, HIGH); JTAG_clock();

    // aqui o modo Ã© exit IR 
    
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    
     // aqui o modo Ã© update IR
        
     // Drive TDI HIGH while moving to SHIFTDR */
    digitalWrite(TDIpin, HIGH);  

    digitalWrite(TMSpin, HIGH); JTAG_clock();
    
    // aqui o modo Ã© select dr scan
    
    digitalWrite(TMSpin, LOW); JTAG_clock();
    digitalWrite(TMSpin, LOW); JTAG_clock();
    
    // aqui o modo estÃ¡ em shift dr

 //digitalWrite(TMSpin, LOW); JTAG_clock(); //extra ?


    /* Issue MAX_JTAG_INIT_CLOCK clocks in SHIFTDR state */
   digitalWrite(TDIpin, HIGH);
   for(n=0;n<300;n++)
    {
       JTAG_clock();
    }

     digitalWrite(TDIpin, LOW);  
}

void JTAG_POSprogram()
{
    int n;
    
 //aqui esta no exit DR
    
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    
    // aqui esta no update DR
    
    digitalWrite(TMSpin, LOW); JTAG_clock();
    
    //Aqui esta no RUN/IDLE
    
    JTAG_EnterSelectDR();   
    JTAG_EnterShiftIR(); 

    // aqui em shift ir


    // IR = CHECK STATUS = 00 0000 0100
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, HIGH); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    
    digitalWrite(TDIpin, LOW); JTAG_clock();
    
    digitalWrite(TDIpin, LOW);   
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    
    
    //aqui esta no exit IR
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    
    //aqui esta no select dr scan



    
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    digitalWrite(TMSpin, LOW); JTAG_clock();
    digitalWrite(TMSpin, LOW); JTAG_clock();
    
    //   aqui esta no shift IR
    
    
    // IR = START = 00 0000 0011
    digitalWrite(TDIpin, HIGH); JTAG_clock();
    digitalWrite(TDIpin, HIGH); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    digitalWrite(TDIpin, LOW); JTAG_clock();
    
    digitalWrite(TDIpin, LOW); JTAG_clock();
    
    digitalWrite(TDIpin, LOW);   
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    
    
    //aqui esta no exit IR
    
    digitalWrite(TMSpin, HIGH); JTAG_clock();
    digitalWrite(TMSpin, LOW); JTAG_clock();
    
    //aqui esta no IDLE
    
    //espera 
    for(n=0; n<200; n++) 
    {
      JTAG_clock();
    }
    
    
    
    JTAG_reset();


      
}
