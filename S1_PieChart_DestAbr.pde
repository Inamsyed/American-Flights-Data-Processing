// written by Inam.SK 29/03/2023
// written by Inam.SK 06/04/2023
// fixed number sequencing Daniel.N 07/04/23

PFont destPieChartFont;
class S1PieChartDestAbr{

  void draw() {
    
  background(200, 100, 0);
  
  destPieChartFont=loadFont("ArialRoundedMTBold-48.vlw");
  textFont(destPieChartFont);
  textSize(45);
  fill (255, 255, 0);
  text("Pie Chart Of Destinations (Abbreviated)" , 100 , 60);
  textSize(20);
  
  S1PieChartdataAccumulation();
  pieChart(500, arrayOfDestinationAngle);
  
  }
  
  void pieChart(float diameter , float[] data)
  {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    fill(gray);
    arc(650, 325, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
    lastAngle += radians(data[i]);
    textSize(30);
    text("Section " + (i+1) , 40, 130 + 50*i);
  }
  
  fill (0,150,255);
  textSize(30);
  text("        = CA " , 120, 130 + 50*0);
  text("        = WA " , 120, 130 + 50*1);
  text("        = FL " , 120, 130 + 50*2);
  text("        = HI " , 120, 130 + 50*3);
  text("        = IL " , 120, 130 + 50*4);

}


void S1PieChartdataAccumulation()
  {
    for (int i = 0 ; i < arrayOfFlights.length ; i++)
    {
      
      if (arrayOfFlights[i].destination.equals("CA")){
        CA++;
      }
      
      else if (arrayOfFlights[i].destination.equals("WA")){
        WA++;
      }
      
       else if (arrayOfFlights[i].destination.equals("FL")){
        FL++;
      }
      
       else if (arrayOfFlights[i].destination.equals("HI")){
        HI++;
      }
      
       else if (arrayOfFlights[i].destination.equals("IL")){
        IL++;
      }
    }
  float sum = CA + WA + FL + HI + IL ;
  CA = ( CA / sum )* 360 ; 
  WA = ( WA / sum )* 360 ; 
  FL = ( FL / sum )* 360 ; 
  HI = ( HI / sum )* 360 ; 
  IL = ( IL / sum )* 360 ; 
  
  arrayOfDestinationAngle[0]= CA ;
  arrayOfDestinationAngle[1]= WA ;
  arrayOfDestinationAngle[2]= FL ;
  arrayOfDestinationAngle[3]= HI ; 
  arrayOfDestinationAngle[4]= IL ; 
  
  }



}
