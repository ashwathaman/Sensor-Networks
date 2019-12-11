import processing.serial.*;
import de.bezier.data.sql.*;
MySQL db ;
Serial xbee ;
String output = "0.00" ;
float tempC;
float tempF;
int yDist;
float[] tempHistory = new float[100];

void setup() {
size (400 ,400);
xbee = new Serial( this , "COM7" , 9600) ;
for(int index = 0; index<100; index++)
{
 tempHistory[index] = 0;
}
frameRate(1) ; // 1 frame per second

String server = "10.50.202.242" ;
String user = "user02" ;
String pass = "user02" ;
String database = "user02" ;
db = new MySQL(this , server , database , user , pass ) ;
if(db.connect()){
  println("Database connected");
}
}
void draw() {

while(xbee.available()>0) {
output = xbee.readStringUntil('\n') ;
if(output != null ) {
tempC = float(output) ;
println(tempC) ;
}
}


 background(123);

 //draw the temp rectangle
 colorMode(RGB, 160);  //use color mode sized for fading
 stroke (0);
 rect (49,19,22,162);
 //fade red and blue within the rectangle
 for (int colorIndex = 0; colorIndex <= 160; colorIndex++) 
 {
 stroke(160 - colorIndex, 0, colorIndex);
 line(50, colorIndex + 20, 70, colorIndex + 20);
 }

//write reference values
 fill(0,0,0);
textAlign(RIGHT);
 text("212 F", 45, 25); 
 text("32 F", 45, 187);
//draw triangle pointer
 yDist = int(160 - (160 * (tempC * 0.01)));
 stroke(0);
 triangle(75, yDist + 20, 85, yDist + 15, 85, yDist + 25);
//write the temp in C and F
 fill(0,0,0);
textAlign(LEFT);
 text(str(int(tempC)) + " C", 115, 37);
 tempF = ((tempC*9)/5) + 32;
 text(str(int(tempF)) + " F", 115, 65);
 
 db.query("INSERT INTO xbeetemperature(d_date, t_time, temperature) VALUES(CURRENT_DATE(), CURRENT_TIME(),%f)",tempC);
  

}