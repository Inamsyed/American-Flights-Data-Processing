// written by Inam.SK 29/03/2023
// written by Inam.SK 06/04/2023
// bug fixed by Daniel.N & Emily.P 07/04/23

import org.gicentre.utils.stat.*;
Flight[] arrayOfFlights;

BarChart barChart;
S2BarChartDist barC1 ;
FloatList numListOfDistances ;

boolean searchPressed;
XYChart lineChart ;
S3LineChartDelay lineC1 ; 
FloatList numListOfDelays;

boolean allowScreen6; 

PImage homeScreen;
PImage logo;

ArrayList widgetList;
PFont widgetFont;
Widget widget0;
Widget widget1;
Widget widget2;
Widget widget3;
Widget widget4;
Widget widget5; 
Widget widget7;

S1PieChartDestAbr Screen1;

ArrayList searchBarList;
userInterfaceSearchBar Query1 ;
userInterfaceSearchBar Query2 ;
userInterfaceSearchBar Query3 ;

float[] arrayOfDestinationAngle = new float[5]; 

ArrayList<String> searchBarValuesList ;

int screenNumber = 0; 

boolean dataManipFunction = false ;

TableOfFlights specificFlights ; // Creation of an object
ArrayList TableOfFlightsList ; 

void setup()
{
  size(1000, 800);
  
  Screen1 = new S1PieChartDestAbr();
  homeScreen = loadImage("AIRPLANEIMAGE.jpg");
  logo = loadImage("MAP.png");
  numListOfDistances = new FloatList();
      
  numListOfDelays = new FloatList();
  
 // updated UI, (colours, positions of widgets) E.P 07/04/23
  widgetList = new ArrayList();
  widgetFont=loadFont("ArialRoundedMTBold-48.vlw");
  widget0 = new Widget(925, 750, 70, 30 , "Back", color(255, 255, 0), widgetFont, EVENT_BUTTON4);
  widget1 = new Widget(325, 300, 350, 40, "Destination PieChart!", color(158, 180, 168), widgetFont, EVENT_BUTTON1);
  widget2 = new Widget(325, 350, 350, 40, "Longest Route BarChart!", color(158, 180, 168), widgetFont, EVENT_BUTTON2);
  widget3 = new Widget(325, 400, 350, 40, "FlightDelay ScatterGraph!", color(158, 180, 168), widgetFont, EVENT_BUTTON3);
  widget4 = new Widget(100, 200, 100, 40, "Search", color(241, 193, 209), widgetFont, EVENT_BUTTON6);
  widget5 = new Widget(325, 500, 350, 40, "Get Search Bar ", color(212, 177, 197), widgetFont, EVENT_BUTTON5);
  widget7 = new Widget(270, 500, 525, 40, "SEARCH FOR FLIGHTS, AIRLINES AND AIRPORTS", color(255), widgetFont, EVENT_BUTTON4);


  widgetList.add(widget0);
  widgetList.add(widget1);
  widgetList.add(widget2);
  widgetList.add(widget3);
  widgetList.add(widget4);
  widgetList.add(widget5);
  widgetList.add(widget7);
  

  
  Table table = loadTable("flights2k.csv" , "header");
  arrayOfFlights = new Flight[table.getRowCount()];
  for (int i = 0 ; i < table.getRowCount() ; i++)
  {
     TableRow row = table.getRow(i);
     String destination = row.getString("DEST_STATE_ABR");
     String origin = row.getString("ORIGIN_STATE_ABR");
     String carrier = row.getString("MKT_CARRIER");
     int flightNumber = row.getInt("MKT_CARRIER_FL_NUM");
     int distance = row.getInt("DISTANCE");
     String date = row.getString("FL_DATE");
     int actualArrivalTime = row.getInt("ARR_TIME");
     int schdArrivalTime = row.getInt("CRS_ARR_TIME");
     
     arrayOfFlights[i] = new Flight(destination , origin , carrier ,  flightNumber , distance , date , actualArrivalTime, schdArrivalTime);
     
  }
  
  barChart = new BarChart(this);
  barC1 = new S2BarChartDist();
  barC1.setup();
  
  
  lineChart = new XYChart( this );
  lineC1 = new S3LineChartDelay();
  lineC1.setup();
  
  searchBarList = new ArrayList();
  Query1 = new userInterfaceSearchBar(100 , 100, "Enter Month Number 1-12: " , 0);
  Query2 = new userInterfaceSearchBar(100 , 135, "Enter Destination: " , 1);
  Query3 = new userInterfaceSearchBar(100 , 170, "Enter Data Range: " , 2);
  searchBarList.add(Query1);
  searchBarList.add(Query2);
  searchBarList.add(Query3);
  
  searchBarValuesList = new ArrayList();
  
  specificFlights = new TableOfFlights();
  TableOfFlightsList = new ArrayList();
  
  allowScreen6 = false;
}

void draw()
{
  if(screenNumber == 20) {
    background(177,210,212);
  textSize(50);
  text("FLIGHT DIRECTORY", 300, 50);
  image(logo, 0, 0, width, height);
  imageMode(CORNER);
    widget1.draw();
    widget2.draw();
    widget3.draw();
    widget4.draw();
    Query1.draw();
    Query2.draw();
    Query3.draw();
  }
   if(screenNumber == 0){
  image(homeScreen, 0, 0, width, height);
  imageMode(CORNER);
    widget7.draw();
    textSize(40);
    text("CSU11013 PROGRAMMING PROJECT", 145, 80);
    textMode(CENTER);
    }
 switch(screenNumber){
    case 1:
    Screen1.draw();
    widget0.draw();
    break;
    
    case 2:
    barC1.draw();
    widget0.draw();
    break;
    
    case 3:
    lineC1.draw();
    widget0.draw();
    break;
    
    case 4:
    background(255,255,102);
    widget1.draw();
    widget2.draw();
    widget3.draw();
    widget4.draw();
    Query1.draw();
    Query2.draw();
    Query3.draw();
    break;
    
    case 6:
    //specificFlights = new TableOfFlights ();
    if (allowScreen6){
    specificFlights.draw();
    widget0.draw();
    }
    break;
  }
    
  if (dataManipFunction == true)
  {
    DataManipulation();
    dataManipFunction = false;
  }
  
  
  
}

void mousePressed(){  
  int event1 ;  
  for(int i = 0; i<widgetList.size(); i++){  
    Widget currentWidget = (Widget) widgetList.get(i);  
    event1 = currentWidget.getEvent(mouseX,mouseY);  
    if (event1 == EVENT_BUTTON4) {  
      screenNumber = 20;  
      return;  
    }  
    if (screenNumber == 20) {  
    switch(event1) {  
    case EVENT_BUTTON1:  
    screenNumber = 1; 
    println("Button 1");
    break;  
    case EVENT_BUTTON2:  
    screenNumber = 2;  
    break;  
    case EVENT_BUTTON3:  
    screenNumber = 3;  
    break;  
    case EVENT_BUTTON4:  
    screenNumber = 4; 
    println("Button 4");
    break;  
    case EVENT_BUTTON6:  
    println("button 6");  
    screenNumber = 6;  
    break;  
  }  
    }  
}  
 for(int i = 0; i < searchBarList.size(); i++)  
 {  
   userInterfaceSearchBar currentSearchBar = (userInterfaceSearchBar) searchBarList.get(i);  
   currentSearchBar.PRESSED(mouseX,mouseY);  
     
}  
}

void keyPressed(){
  println("keybaord warroier");
  
  for(int i = 0; i < searchBarList.size(); i++)
 {
   
   userInterfaceSearchBar currentSearchBar = (userInterfaceSearchBar) searchBarList.get(i);
 
   if(currentSearchBar.KEYPRESSED(key,keyCode) == true)
   {
     searchBarValuesList.add(currentSearchBar.Text) ;
     dataManipFunction = true;
   }
   
}


}

void DataManipulation(){
 
  SB_Month = searchBarValuesList.get(0);
  SB_Destination = searchBarValuesList.get(1);
  SB_DataRange = int(searchBarValuesList.get(2));
  allowScreen6 = true; 
  specificFlights.setup();
  
}
