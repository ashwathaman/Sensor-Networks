#include<SoftwareSerial.h>
String receive;
short xBeeTx = 11;
short xBeeRx = 12;
SoftwareSerial xBeeSerial(xBeeRx,xBeeTx);
void setup(){
Serial.begin(9600);
xBeeSerial.begin(9600);
}
void loop(){
if(xBeeSerial.available()>0){
receive=xBeeSerial.readStringUntil('\n'); // read in data as a String
int receiveInt = receive.toInt(); // convert a String into an integer
Serial.println(receiveInt);
}
}
