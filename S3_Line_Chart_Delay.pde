// By Inam.Sk 06/04/2023
import org.gicentre.utils.stat.*;
PFont LineChartDelayFont ; 
class S3LineChartDelay{
  
  void setup(){
    
  S3LineChartdataAccumulation();
  lineChart.setData(new float[] {10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200},
              new float[] {A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T});
  
  lineChart.showXAxis(true); 
  lineChart.showYAxis(true); 
  
  lineChart.setMinY(0);

  lineChart.setPointColour(color(255,0,100));
  lineChart.setPointSize(10);
  lineChart.setLineWidth(5);
  lineChart.setLineColour(color(100,215,0));
    
  }
  
  
  void draw(){
    
    background(234,255,123);
    LineChartDelayFont = loadFont("ArialRoundedMTBold-48.vlw");
    textFont(LineChartDelayFont);
    
    
    fill(100, 0, 612);
    textSize(40);
    text("Number Of Flights Delayed by X Minutes", 100, 50);
    
    textSize(25);
    fill(0);
    text("Number Of Minutes Delayed" , 400, 580 );
    text(" Number " , 10, 120); 
    text(" Of " , 30, 160); 
    text(" Flights " , 10, 200); 
    lineChart.draw(150,60,800,475);
  }
  
  
  void S3LineChartdataAccumulation(){
  
  
  for (int i = 0 ; i < arrayOfFlights.length ; i++)
    {
      
      float scheduled = arrayOfFlights[i].schdArrivalTime ; 
      float actual = arrayOfFlights[i].actualArrivalTime ; 
      
      float Sremainder1 = scheduled % 100 ; 
      float Aremainder2 = actual % 100 ; 
      
      scheduled = ( (int(scheduled / 100))*60 ) + Sremainder1 ; 
      actual = ( ( int(actual / 100) )*60 ) + Aremainder2 ; 
      
      float difference = actual - scheduled ; 
      
      if (difference > 0){
        numListOfDelays.append(difference);
      }
      
    }
    
  
  numListOfDelays.sortReverse();
  
  for (int z = 0 ; z < numListOfDelays.size() ; z++){
    
    if (numListOfDelays.get(z)<= 10){
      A++ ;
    }
    else if (numListOfDelays.get(z)<= 20){
      B++ ;
    }
    else if (numListOfDelays.get(z)<= 30){
      C++ ;
    }
     else if (numListOfDelays.get(z)<= 40){
      D++ ;
    }
    else if (numListOfDelays.get(z)<= 50){
      E++ ;
    }
     else if (numListOfDelays.get(z)<= 60){
      F++ ;
    }
    else if (numListOfDelays.get(z)<= 70){
      G++ ;
    }
     else if (numListOfDelays.get(z)<= 80){
      H++ ;
    }
    else if (numListOfDelays.get(z)<= 90){
      I++ ;
    }
     else if (numListOfDelays.get(z)<= 100){
      J++ ;
    }
    else if (numListOfDelays.get(z)<= 110){
      K++ ;
    }
     else if (numListOfDelays.get(z)<= 120){
      L++ ;
    }
    else if (numListOfDelays.get(z)<= 130){
      M++ ;
    }
     else if (numListOfDelays.get(z)<= 140){
      N++ ;
    }
    else if (numListOfDelays.get(z)<= 150){
      O++ ;
    }
     else if (numListOfDelays.get(z)<= 160){
      P++ ;
    }
    else if (numListOfDelays.get(z)<= 180){
      Q++ ;
    }
    else if (numListOfDelays.get(z)<= 200){
      R++ ;
    }
    
  }
  
  
  }
}
