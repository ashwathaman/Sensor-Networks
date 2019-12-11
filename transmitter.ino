#include<SoftwareSerial.h>
int piezo = 5;
int TMP36 = A0; // The middle lead is connected to analog - in 0.
int temperature = 0;
int wait_ms = 20; // wait time betweem measurements in millisec .
#define NR_SAMPLES 10
int samples[NR_SAMPLES]; // array of samples
short xBeeTx = 11;
short xBeeRx = 12;
SoftwareSerial xBeeSerial(xBeeRx,xBeeTx);

void setup(){
pinMode(5,OUTPUT);
pinMode(13,OUTPUT);
xBeeSerial.begin(9600);
Serial.begin (9600) ;
}



void loop(){
float sum =0.0;

int  temp= map(analogRead(TMP36),0,410,-50,150);

  delay(wait_ms);


xBeeSerial.println(temp);
Serial.println(temp);
if (temp < 5){
  digitalWrite(5,HIGH);
  digitalWrite(13,HIGH);
  delay(500);
  digitalWrite(piezo,LOW);
  digitalWrite(13,LOW);
  } 
  else {
    digitalWrite(piezo,LOW);
  }
}






