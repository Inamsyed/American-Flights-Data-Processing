class TableOfFlights{
 
  String a;
  String b;
  int c;
  int d ;
  int e ;
  int f ;
  int lengthh;
  int z = 0 ;
 
  Flight currentFlight;
  Flight[] arrayOfFlightsList;
  IntDict flightDict;
  int OriginFlightValues[]; 
  String OriginFlightNames[]; 
  int[] arrayOfOriginAngles = new int[5]; 
  float sum;
 
  void setup(){
   
    TableOfFlightsDataAccumulation();
    textSize(5);
    TopOriginDictGeneration();
    
    
    
    }
    
 
  void draw(){
   
    background(244 , 220 , 181);
   
   
    for (int i = 0 ; i <= SB_DataRange ; i++)
    {
     
    if(SB_DataRange <= arrayOfFlightsList.length)
    {
    a = arrayOfFlightsList[i].date;
    b = arrayOfFlightsList[i].origin;
    c = arrayOfFlightsList[i].flightNumber;
    d = arrayOfFlightsList[i].distance;
    e = arrayOfFlightsList[i].schdArrivalTime;
    f = arrayOfFlightsList[i].actualArrivalTime;
    String R = ("Date                      Origin        F No.             Dist        Sch Arr    Acc Arr");
   
    String s = (a);
    String x = (b);
    String t = str(c);
    String u = str(d);
    String v = str(e);
    String w = str(f);
   fill(0);
    text(R , 25 , 16);
   
    text(s , 25 , 35 * i);
    text(x , 200 , 35 * i);
    text(t , 300 , 35 * i);
    text(u , 410 , 35 * i);
    text(v , 510 , 35 * i);
    text(w , 605 , 35 * i);
    
  
    text("Top 5 Origin Airports", 800, 25);
    fill(50, 111, 216);
    text("1: " + OriginFlightNames[0] + " - " + OriginFlightValues[0], 800, 50);
    fill(216, 50, 200);
    text("2: " + OriginFlightNames[1] + " - " + OriginFlightValues[1], 800, 75);
    fill(252, 55, 153);
    text("3: " + OriginFlightNames[2] + " - " + OriginFlightValues[2], 800, 100);
    fill(173, 252, 55);
    text("4: " + OriginFlightNames[3] + " - " + OriginFlightValues[3], 800, 125);
    fill(252, 172, 53);
    text("5: " + OriginFlightNames[4] + " - " + OriginFlightValues[4], 800, 150);
   
    pieChart(200, arrayOfOriginAngles);
    }
   

  }
 
 
  }
 
  void TableOfFlightsDataAccumulation(){
   
    for (int i = 0 ;  i < arrayOfFlights.length ; i ++ )
    {
      if (str(arrayOfFlights[i].date.charAt(4)).equals(SB_Month))
      {
        if(arrayOfFlights[i].destination.equals(SB_Destination))
        {
        lengthh++;
        }
      }
    }
   
    arrayOfFlightsList = new Flight[lengthh];
   
    for (int i = 0 ;  i < arrayOfFlights.length ; i ++ )
    {
     
      if (str(arrayOfFlights[i].date.charAt(4)).equals(SB_Month))
      {
        if(arrayOfFlights[i].destination.equals(SB_Destination))
        {
         arrayOfFlightsList[z]  = arrayOfFlights[i];
         z++;
        }
      }
    }
    //printArray(arrayOfFlightsList);
    //print(arrayOfFlightsList[0].distance);
   
  }
  
  void TopOriginDictGeneration() {
    
  //  String originAirport1 = arrayOfFlightsList[0].origin;
  //  int originAirport1Appearances =0 ;
    flightDict = new IntDict();
    OriginFlightValues = new int[5];
    OriginFlightNames = new String[5];
    
    
    for (int i = 1; i < arrayOfFlightsList.length; i++){
      
    if (!flightDict.hasKey(arrayOfFlightsList[i].origin)) {
      flightDict.set(arrayOfFlightsList[i].origin, 1);
    } else {
      flightDict.increment(arrayOfFlightsList[i].origin);
    }
      
    }
    flightDict.sortValuesReverse();
    for (int i = 0; i < 5; i++) {
      OriginFlightValues[i] = flightDict.valueArray()[i];
      OriginFlightNames[i] = flightDict.keyArray()[i];
      
    }
    
    sum = 0;
    for(int i = 0; i < OriginFlightValues.length; i++){
      sum += flightDict.valueArray()[i];
    }
    print(sum);
    
    for(int i = 0; i < 5; i++) {
      arrayOfOriginAngles[i] = int((OriginFlightValues[i] / sum) * 360);
    }
    print(arrayOfOriginAngles);
    
    
    print(flightDict);
  
  }
  void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    switch(i) {
     case 0: 
     fill(50, 111, 216);
     break;
     case 1: 
     fill(216, 50, 200);
     break;
     case 2: 
     fill(252, 55, 153);
     break;
     case 3: 
     fill(173, 252, 55);
     break;
     case 4: 
     fill(252, 172, 53);
     break;
    }
    arc(width-150, height-500, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
    lastAngle += radians(data[i]);
  }
   
    
}
}

    

    
    
    
  //  }
    
    
  //}
    
 
 
