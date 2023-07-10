// Written  by Inam . sk 06/04/2023

import org.gicentre.utils.stat.*;
PFont distBieChartFont;
class S2BarChartDist{


  void setup()
  {
    
  S2BarChartDataAccumulation();
  
 
  barChart.setData(new float[]{ position0 , position1 , position2 , position3, position4});
  barChart.setMinValue(0);
  barChart.setMaxValue(position0 + 200);
  
  
  barChart.setBarLabels(new String[] {(origin0 + " To " + destination0),
  (origin1 + " To " + destination1),(origin2 + " To " + destination2),
  (origin3 + " To " + destination3),(origin4 + " To " + destination4)});
  
  barChart.showValueAxis(true);
  barChart.showCategoryAxis(true);
  barChart.setBarColour(color(230, 0, 0));
  barChart.setBarGap(10);
   
  }
  
  void draw()
  {
    
    background(255);
    distBieChartFont = loadFont("ArialRoundedMTBold-48.vlw");
    textFont(distBieChartFont);
    
    fill(0, 0, 612);
    textSize(50);
    text("Top 5 Longest Flight Distance", 190, 50);
    
    textSize(25);
    barChart.draw(200,50,800,500);
    fill(0);
    
    text("Distance (Miles)" , 10 , 575);
    fill(255, 100, 20);
    text(position0 , 230 , 575);
    text(position1 , 375 , 575);
    text(position2 , 530 , 575);
    text(position3 , 670 , 575);
    text(position4 , 830 , 575);
    
    
    
  }
  
 
  
  void S2BarChartDataAccumulation()
  {
    
    for (int i = 0 ; i < arrayOfFlights.length ; i++){
      
      float current = arrayOfFlights[i].distance;
      if (numListOfDistances.hasValue(current)){
        continue;
      }
      else{
      numListOfDistances.append(current);
      }
    }
   numListOfDistances.sortReverse();
   position0 = numListOfDistances.get(0);
   position1 = numListOfDistances.get(1);
   position2 = numListOfDistances.get(2);
   position3 = numListOfDistances.get(3);
   position4 = numListOfDistances.get(4);
   position5 = numListOfDistances.get(5);
   position6 = numListOfDistances.get(6);
   
   
   for (int x = 0 ; x < arrayOfFlights.length ; x++){
     
     if (arrayOfFlights[x].distance == position0){
       
       origin0 = arrayOfFlights[x].origin;
       destination0 = arrayOfFlights[x].destination; 
       
     }
     
     else if (arrayOfFlights[x].distance == position1){
       
       origin1 = arrayOfFlights[x].origin;
       destination1 = arrayOfFlights[x].destination; 
       
     }
     
      else if (arrayOfFlights[x].distance == position2){
       
       origin2 = arrayOfFlights[x].origin;
       destination2 = arrayOfFlights[x].destination; 
       
     }
     
     else if (arrayOfFlights[x].distance == position3){
       
       origin3 = arrayOfFlights[x].origin;
       destination3 = arrayOfFlights[x].destination; 
       
     }
     else if (arrayOfFlights[x].distance == position4){
       
       origin4 = arrayOfFlights[x].origin;
       destination4 = arrayOfFlights[x].destination; 
       
     }
     
   }
   
  }
  

  
  
}
