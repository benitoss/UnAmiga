#include "SdFat.h"
#include <SPI.h>
#include <Wire.h>

const unsigned char version[4] = "101"; // v 1.01

const int TCKpin = PB0;   
const int TDIpin = PB1;    
const int TMSpin = PB10;   
const int TDOpin = PB11; //input  

const int CS_SDCARDpin  = PA4; 
const int LEDpin = PC13;  

SdFat sd1(1);

SdFile  file;
SdFile  entry;

//bool SD_ok = false;
bool CORE_ok = true;

char sd_buffer[1024];  
unsigned char ret;

unsigned char last_ret;
unsigned char cur_select = 0;
    
#define START_PIN  PA8

char file_selected[64];

#define NSS_PIN  PB12
#define NSS_SET ( GPIOB->regs->BSRR = (1U << 12) )
#define NSS_CLEAR ( GPIOB->regs->BRR = (1U << 12) )

bool isExtension(char* filename, const char* extension) 
{
    int8_t len = strlen(filename);
    char ext[5];
    bool result;
  
    //local copy of the extension
    strcpy(ext, extension);  
  
    if ( strstr(strlwr(filename + (len - 4)), strlwr(ext)) ) 
    {
      result = true;
    } 
    else 
    {
      result = false;
    }
    
    return result;
}

bool navigateMenu( const char* extension, bool canAbort ) 
{
    int index=0;
    unsigned char total_files = 0;
    unsigned char page = 0;
    unsigned char last_page = 0;
    bool selected = false;
    bool showfile = false;
    bool filter = false;
    bool isDir = false;
    bool isSelectedDir = false;
    bool insideDir = false;
    unsigned char key;
    unsigned char cmd;
    unsigned char last_key = 31; //only the 5 lower bit are keys
    unsigned char last_cmd = 1;
    char ext[5];
    unsigned char cur_line = 0;

    unsigned char total_show = 0;

    cur_select=0;

    Serial.println("navigateMenu");
  
    //local copy of the extension
   // strcpy(ext, extension);

   
    while (!selected)
    {
            total_show = 0;
            sd1.vwd()->rewind(); 
            total_files = 0;
            cur_line = 0;
      
             if ( !sd1.vwd()->isRoot() )
             {
                   insideDir = true;
                   OsdWriteOffset(cur_line - (page*8), "<..>", (cur_select==cur_line) , 0, 0, 0);

                   cur_line++;
                   total_files++;   
                   total_show++;             
             }
             else
             {
                  insideDir = false;
             }

               
            while (entry.openNext(sd1.vwd(), O_READ)) 
            {
        
                char filetemp[64]; 
                char filename[64]; 
                
                entry.getName(filename,64);


                showfile = false;
     
                if ( strlen(extension) < 2 )
                {
                   filter = false;
                   showfile = true;
                }
                else if (isExtension(filename, extension)) 
                {
                   filter = true;
                   showfile = true;
                }
      
                if (showfile)
                {

                     unsigned char len = strlen(filename);
                     bool f_selected = false;
                    
                     if (cur_select==cur_line) 
                     {
                        f_selected = true;
                        strcpy(file_selected,filename);
                        isSelectedDir= entry.isDir();
                     }

                      isDir = entry.isDir();
                      if (isDir) 
                      {
                        strcpy(filetemp, "<DIR> ");
                        strcat(filetemp, filename);
                        strcpy(filename, filetemp);
                        
                      }


                      if (cur_line >= page*8 && total_show <= 8)
                      {

             
                          if (!filter)
                          {
                              OsdWriteOffset(cur_line - (page*8), filename, f_selected , 0, 0, 0);
                          }
                          else
                          {
                              OsdWriteOffset(cur_line - (page*8), strtok(filename, "."), f_selected , 0, 0, 0);
                          }

                          total_show++;
                      }
                      
                      cur_line++;
                      total_files++;
                }
          
                   
                
                entry.close();
            }


        // Serial.print("total files ");    
        // Serial.println(total_files);    
      
    
    
        // set second SPI on PA12-PA15
        SPI.setModule(2);
        NSS_SET; // ensure SS stays high for now

       Serial.println("Waiting keys!");
        
        NSS_CLEAR;
        key = SPI.transfer(0x10); //command to read from ps2 keyboad
       
        while (true)
        {
   
            key = SPI.transfer(0); //dummy data, just to read the response

            cmd = (key & 0xe0) >> 5; //just the 3 msb are the command
            key = key & 0x1f; //just the lower 5 bits are keys
/*
           Serial.print ("\n");
           Serial.print (cmd);
           Serial.print (":");
           Serial.print (key);
           Serial.print (" = ");
           Serial.print ((char)key);
*/            
            if (key!=last_key || cmd != last_cmd) break; //something was pressed on keyboard or a command arrived
       
        }
        
        NSS_SET; // SS high 
 
        last_key = key;
        last_cmd = cmd;


        
        SPI.setModule(1);

       Serial.println("Key received");

        if (key == 30) //up
        {
          if (cur_select > 0) cur_select--;

           if (cur_select < page*8) 
           {
              cur_select = page*8 - 1;
              page--;
           }
        }
        else if (key == 29) //down
        {
           if (cur_select < total_files-1) cur_select++; 

           if (cur_select > ((page+1)*8)-1) page++;
        }
        else if (key == 27) //left
        {
           if (page > 0) page--;  
        }
        else if (key == 23) //right
        {
           if (page < ((total_files-1)/8)) page++; 
        }
        else if (key == 15) //enter
        {
            if (insideDir && cur_select == 0)
            {
                sd1.chdir();
                page = 0;
                last_page = 99; //to force a clear 
            }
            else if ( isSelectedDir)
            {
                sd1.chdir(file_selected);
                page = 0;
                last_page = 99; //to force a clear 
            }
            else
            {
                selected = true;  
            }
        }
        else if ((cmd == 0x01 || cmd == 0x02) && canAbort) //F12 - abort
        {
            return false;  
        }

        if (page != last_page)
        {
            last_page = page;
            if (key !=30) cur_select = page*8;
            OsdClear();
        }

    }
    
    return true;
    
}

void waitACK (void)
{
   //----------------------------------------------------
      // set second SPI on PA12-PA15
      SPI.setModule(2);
      NSS_SET; // ensure SS stays high for now
      //syncronize and clear the SPI buffers
   
      Serial.println ("waitACK");
      
      while (ret != 'K') //wait for command acknoledge
      {
          NSS_CLEAR;  
          ret = SPI.transfer(0); //clear the SPI buffers
          delay(100); //wait a little to receive the last bit
          NSS_SET; // ensure SS stays high for now
           
          if (last_ret !=ret)
          {
            last_ret = ret;
           
          }
        /*  
          Serial.print ("\n");
            Serial.print (ret);
            Serial.print ("=");
            Serial.print ((char)ret);
            Serial.print ("\n");
          */  
      }
   
      SPI.setModule(1);
      //----------------------------------------------------
}


void waitSlaveCommand (void)
{
      unsigned char cmd;
      unsigned char char_count = 0;

       Serial.println("\nwaitSlaveCommand");
       
      //----------------------------------------------------
      // set second SPI on PA12-PA15
      SPI.setModule(2);
      NSS_SET;
      
      NSS_CLEAR;  //SS clear to send a comand
      ret = SPI.transfer(0x10); //read data from slave
          
      while (1) //wait for commands
      {

            cmd = SPI.transfer(0x00); //Dummy data, just to get the response 
     
            cmd = (cmd & 0xe0) >> 5; //just the 3 msb are the command

 

            if (cmd == 0x01 || cmd == 0x02)
            {
  

                 char_count = 0;

                 OsdClear();
                 EnableOsdSPI();

               
                  
                //let's ask if we need a specific file or need to show the menu
                ret = SPI.transfer(0x14); // command 0x14 - get STR_CONFIG
                
                while(ret != 0)
                {
                    delay(50);
                    ret = SPI.transfer(0x00); //get one char at time
                   
                    sd_buffer[char_count] = ret; //use the sd_buffer as a general buffer
                    
                 //   Serial.print ("\n command 0x14 reply:");
                 //   Serial.print (ret);
                 //   Serial.print ("=");
                 //   Serial.print ((char)ret);
                    char_count++;
                    
                }

                //check if we have a CONF_STR
                if (char_count>1 && cmd == 0x01)
                {

                      Serial.println("CMD 0x01");

                      SPI.transfer(0x55); // command 0x55 - UIO_FILE_INDEX;
                      SPI.transfer(0x00); // index 0 - ROM
      
                      NSS_SET; //slave deselected
      
                      NSS_CLEAR; //slave selected
                
                      char *token;
                      token = strtok(sd_buffer, ",");
                      
                      Serial.print ("\ntoken1:");
                      Serial.print (token);
                            
                      if (strcmp(token, "P") == 0) //it's a filename for data pump
                      {
                            token = strtok(NULL, ",");
                            Serial.print ("\ntoken2 pump:");
                            Serial.print (token);
                            strcpy(file_selected,token);
                      
                            dataPump();
                      }
                      else if (strcmp(token, "O") == 0) //it's an Option for menu
                      {
                          token = strtok(NULL, ",");
                          Serial.print ("\ntoken2 option:");
                          Serial.print (token);
  
                      }
                }
                else //we dont have a STR_CONF, so show the menu or CMD = 0x02
                {
                      Serial.println("CMD 0x02");

                      Serial.println ("we dont have a STR_CONF, so show the menu");

                      NSS_SET; 
  
                      //show the menu to navigate
                      OSDVisible(true);
                    
                      if (navigateMenu("", true))
                      {
                          NSS_SET; //slave deselected
                          
                          spi_osd_cmd_cont(0x55); // command 0x55 - UIO_FILE_INDEX;
                         // SPI.transfer(cur_select + 1); // file index 
                         SPI.transfer(0x01); // index as 0x01 for Sinclair QL 
                        
                          NSS_SET; //slave deselected
          
                          NSS_CLEAR; //slave selected
                          
                          Serial.println("we will execute a data pump 2!");     
                          dataPump();
                      }
      
                      OSDVisible(false);
                }
                
                break; //ok!
            }
            
            else if (cmd == 0x07)
            {
              Serial.println("CMD 0x07");
              break;
            }
          
      }
   
      DisableOsdSPI();
      //----------------------------------------------------
}

void dataPump (void)
{
        unsigned long file_size;
        char buffer_temp[6];
        unsigned char percent = 0;
        unsigned long loaded = 0;

        int state = LOW;

        unsigned char digit, val;

        //convert to lower case
        strlwr(file_selected);

        memcpy(buffer_temp, &file_selected[strlen(file_selected) - 4], 4);
        buffer_temp[4] = '\0';

        file.open(file_selected);
        file_size = file.fileSize();
                
        SPI.setModule(2);
        NSS_SET; // ensure SS stays high for now
        
        Serial.print ("\ndata pump : ");
        Serial.println (file_selected);

        Serial.print ("file ext : ");
        Serial.println ((char*)buffer_temp);

        Serial.print ("file size : ");
        Serial.println (file_size);

        // config buffer - 16 bytes
        spi_osd_cmd_cont(0x60); //cmd to fill the config buffer

        // spi functions transfer the MSB byte first
        spi32(file_size); // 4 bytes for file size

        //3 bytes for extension
        spi8(buffer_temp[1]);
        spi8(buffer_temp[2]);
        spi8(buffer_temp[3]);
        spi8(0xFF);
        
        spi8(0xFF);
        spi8(0xFF);
        spi8(0xFF);
        spi8(0xFF);
        
        spi8(0xFF);
        //last bytes as STM version
       // spi8(version[2] - '0');
        spi8(version[2] - '0');
        spi8(version[1] - '0');
        spi8(version[0] - '0');
        
        DisableOsdSPI(); 
    
        SPI.setModule(1); // select the SD Card SPI 
        

        while(file.available()) 
        { 
            unsigned char val = file.read(sd_buffer, sizeof(sd_buffer));
             Serial.println ("block read");
            SPI.setModule(2); // select the second SPI (connected on FPGA)
            NSS_CLEAR;  //SS clear to send a comand
            ret = SPI.transfer(0x61); //start the data pump to slave
            
            for (int f=0; f<sizeof(sd_buffer); f++) //no puede ser el tamaño del sector, tiene q ser el tamaño del archivo!!!!
            {
                ret = SPI.transfer (sd_buffer[f]);
              //  Serial.println (sd_buffer[f]);
           //   Serial.println(ret);
            }
            NSS_SET; //end the pumped block
            
            loaded += sizeof(sd_buffer);
            percent = loaded * 100 / file_size;

            digit = 0;
            val = percent;
              while (val > 9)
              {
                val -= 10;
                digit++;
              }
            
            
            buffer_temp[0] = ' ';
            buffer_temp[1] = '0' + digit;
            buffer_temp[2] = '0' + val;
            buffer_temp[3] = '%';
            buffer_temp[4] = ' ';
            buffer_temp[5] = '\0';
                     
            OsdWriteOffset(6, "            Loading", 0 , 0, 0, 0);
            OSD_progressBar(7, buffer_temp, percent);
            
            SPI.setModule(1); // select the SD Card SPI   

            state++;
            digitalWrite(LEDpin, state>>2 & 1); //led off
        }

        digitalWrite(LEDpin, HIGH); //led off
        
        file.close();
          
        //CLEAR THE LOADING MESSAGE
        OsdWriteOffset(6, " ", 0 , 0, 0, 0);
        OsdWriteOffset(7, " ", 0 , 0, 0, 0);

        Serial.println ("end data");
        spi_osd_cmd_cont(0x62); // end the data pump

        NSS_SET; // SS end sequence
}


//   JTAG   ////////////////////////////////////////////////////////////////////////////////////////////////

void setupJTAG()
{

  pinMode(TCKpin, OUTPUT);
  pinMode(TDOpin, INPUT_PULLUP);
  pinMode(TMSpin, OUTPUT);
  pinMode(TDIpin, OUTPUT);

  digitalWrite(TCKpin, LOW);
  digitalWrite(TMSpin, LOW);
  digitalWrite(TDIpin, LOW);
}

void error() 
{
      Serial.println("JTAG");
      Serial.println("ERROR!!!!");
}


void program_FPGA()
{
    unsigned long bitcount = 0;
    bool last = false;
    int n = 0; 
    


    Serial.print ("Programming");

   // display.setTextSize(1);
   // display.setCursor(0,40);
    //display.println("Programando");
    //display.display();
    
    JTAG_PREprogram(); 


    //writetofile ("Inicio programacao ------------------------------");

    int mark_pos = 0;
    int total = file.fileSize();
    int divisor = total / 32; 
    int state = LOW;
    
    while(bitcount < total)  //155224
    { 
        
        unsigned char val = file.read();
        int value;
        
        if (bitcount % divisor == 0) 
        {
            Serial.print ("*");

    
            state = !state;

          digitalWrite(LEDpin, state);
          
       //      display.setCursor(mark_pos*8,55);
        //    display.println("*");
         //   display.display();
         //   mark_pos++;
        }
        bitcount++;
  
      //pula os primeiros 44 caracteres do RBF (header no cyclone II)
      //if (bitcount<45) continue; 

        for (n = 0; n <= 7; n++)
        {
            value = ((val >> n) & 0x01);
            digitalWrite(TDIpin, value); JTAG_clock();
        }

    }

      //writetofile ("Additional 16 bytes of 0xFF ------------------------------------------");
      
      /* AKL (Version1.7): Dump additional 16 bytes of 0xFF at the end of the RBF file */
      for (n=0;n<127;n++ )
      {
          digitalWrite(TDIpin, HIGH); JTAG_clock();

        // writetofile ("1");
      }
 
      //   writetofile ("1 - TMS 1");

      digitalWrite(TDIpin, HIGH); 
      digitalWrite(TMSpin, HIGH);
      JTAG_clock();
      
       
      // writetofile ("fim programacao ------------------------------------------");     

     
      
          Serial.println ("");
          Serial.print ("Programmed ");
          Serial.print (bitcount);
          Serial.println(" bytes");
      
      
    file.close();

    JTAG_POSprogram();
}


void initOSD(void)
{
    EnableOsdSPI();  
    OsdClear();
    OSDVisible(true);
}

void removeOSD(void)
{
    EnableOsdSPI();  
    OsdClear();
    OSDVisible(false);
    DisableOsdSPI();
}

void initialData(void)
{

        // config buffer - 16 bytes
        spi_osd_cmd_cont(0x60); //cmd to fill the config buffer

        spi8(0xFF);
        spi8(0xFF);
        spi8(0xFF);
        spi8(0xFF);

        spi8(0xFF);
        spi8(0xFF);
        spi8(0xFF);
        spi8(0xFF);
        
        spi8(0xFF);
        spi8(0xFF);
        spi8(0xFF);
        spi8(0xFF);
        
        spi8(0xFF);

        //last bytes as STM version
        spi8(version[2] - '0');
        spi8(version[1] - '0');
        spi8(version[0] - '0');
        
        DisableOsdSPI(); 
}

/////////////////////////////////////////////////////////////////////////


void setup (void)
{

      //Initialize serial and wait for port to open:
      Serial.begin(9600);
      while (!Serial) 
      {
          ; // wait for serial port to connect. Needed for native USB port only
      }
    
      Serial.println("Serial ok...");
      

      
      pinMode(LEDpin, OUTPUT);
      
      pinMode(TCKpin, INPUT);
      pinMode(TDOpin, INPUT);
      pinMode(TMSpin, INPUT);
      pinMode(TDIpin, INPUT);
      
      pinMode(NSS_PIN, OUTPUT); // configure NSS pin
      pinMode(START_PIN, INPUT);
      
      // set second SPI on PA12-PA15
      SPI.setModule(2);
      NSS_SET; // ensure SS stays high for now
      SPI.begin ();
      SPI.setClockDivider(SPI_CLOCK_DIV2); //4mhz SPI
      NSS_SET; //slave deselected
      SPI.setModule(1); // select the SD Card SPI

      if (!sd1.begin(CS_SDCARDpin, SD_SCK_MHZ(50))) 
      {
            Serial.println("SD Card initialization failed!");
      
            initOSD();
            OsdWriteOffset(3, "          No SD Card!!! ", 1, 0, 0, 0 ); 
      
            //hold until a SD is inserted
            while (!sd1.begin(CS_SDCARDpin, SD_SCK_MHZ(50))) {}
    
            removeOSD();
      } 
    
      strcpy(file_selected,"core.rbf");
      if (!sd1.exists(file_selected)) 
      { 
         Serial.println ("core.rbf not found");
          CORE_ok = false;
      }
      
      //SD_ok = true;
 
      Serial.println("SD Card initialization done.");
    
 
          
         waitACK();
         initialData();
      

}  // end of setup

void loop (void)
{

        Serial.println("loop");

/*
        //--- Test the data pump the waiting for commands
        while(1)
        {
            waitACK();
            waitSlaveCommand();
            delay(500);
        }
        //----------------------
*/      
        
        //if we have a core.rbf, lets transfer, without a menu
        if  (CORE_ok)
        {
              file.open(file_selected);
            
              digitalWrite(LEDpin, HIGH); //led off
            
              delay(300);                       // wait for the FPGA power on
              setupJTAG();
              if (JTAG_scan() == 0)    program_FPGA();
            
              Serial.println("OK, finished");
              
              //loop forever waiting commands
              while(1)
              {
                    waitACK();
                    waitSlaveCommand();
                    delay(500);
              }
        }
        else // no core, start the menu
        {
            //  root = SD.open("/");
                
              EnableOsdSPI();  
              OsdClear();
              OSDVisible(true);
              
              if (!navigateMenu(".rbf", true)) //if we receive a command, go to the command state (to make de development easier)
              {
                
                OSDVisible(false);
                
                while(1)
                {
                      waitACK();
                      waitSlaveCommand();
                      delay(500);
                }
              }
              
              CORE_ok = true;
        }
        
     //   waitACK();
      //  waitSlaveCommand();
        
        /*
        //void OSD_PrintText(unsigned char line, char *text, unsigned long x, unsigned long width(qtd *8), unsigned long scroll_offset, unsigned char invert)
        OSD_PrintText(0, "Load *.PRG", 30, 80, 0, 0);
        OSD_PrintText(1, "Video Standard:", 30, 120, 0, 0);
        OSD_PrintText(2, "Joysticks:", 30, 80, 0, 0);
        OSD_PrintText(3, "nopqrAAAAT", 30, 80, 0, 255);    
        OSD_PrintText(4, "stuvwEBCDE", 30, 80, 0, 0);
        OSD_PrintText(5, "xyzavFBCDE", 30, 80, 0, 255);
        OSD_PrintText(6, "cdefgGSDFG", 30, 80, 0, 0);
        OSD_PrintText(7, "hijklHSDFG", 30, 80, 0, 0);
        
        delay(1000);
        OsdClear();
        
        
        //void OsdWriteOffset(unsigned char n, char *s, unsigned char invert, unsigned char stipple,char offset, char arrow)
        OsdWriteOffset(0, "Load *.PRG", 0, 1, 0, 0);
        OsdWriteOffset(1, "Video Standard:", 255, 0, 0, 0);
        OsdWriteOffset(2, "Joysticks:", 255, 0, 0, 0);
        OsdWriteOffset(3, "nopqrAAAAT", 0, 0, 0,0); 
        OsdWriteOffset(4, "AMIGA      <DIR>", 1, 0, 0,0);
        OsdWriteOffset(5, "APPLEII    <DIR>", 0, 0, 0,0);
        OsdWriteOffset(6, "ATARI      <DIR>", 0, 0, 0,0);
        OsdWriteOffset(7, "nopqrAAAAT", 0, 0, 0,0); //arrows only at line 7
        
           delay(1000);
        */
        /*        
        
         SPI.setModule(2); // select the second SPI (connected on FPGA) 
           NSS_CLEAR; // slave active
        
           ret = SPI.transfer (0x20); // write to osd
        
        
                  
            NSS_SET; //slave deselected
            SPI.setModule(1); // select the SD Card SPI
        
        SPI.setModule(2); // select the second SPI (connected on FPGA) 
           NSS_CLEAR; // slave active
        
           ret = SPI.transfer (0x27); // write to osd
           
           for (int i=0; i<128;i++)       SPI.transfer (0xaa);
            
            NSS_SET; //slave deselected
            SPI.setModule(1); // select the SD Card SPI
        
            while(1){}
        
        //sendcmdDataPump()
        
        /*
        //----------------------------------------------------
        // set a command 10 to to send data to slave
        // note we need to send the command at the beggining to each block
        // also a communting between SPI 1 and 2 are needed to read the data from SD card
        Serial.print ("\ncommand 0x10");
        while(file.available()) 
        { 
            unsigned char val = file.read(sd_buffer, sizeof(sd_buffer));
            SPI.setModule(2); // select the second SPI (connected on FPGA)
            NSS_CLEAR; // slave active
            
            SPI.transfer (0x10); // CMD = 0x10 = pump data to slave
            
            for (f=0; f<sizeof(sd_buffer); f++)
            {
                SPI.transfer (sd_buffer[f]);
                //Serial.print (sd_buffer[f]);
            }
            
            NSS_SET; //slave deselected
            SPI.setModule(1); // select the SD Card SPI   
        }
        //----------------------------------------------------
        
        
           
        Serial.print ("Done... Infinit Loop! ");
        while(1){}
        */
         
}  // end of loop
