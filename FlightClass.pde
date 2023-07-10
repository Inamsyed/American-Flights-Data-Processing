// written by Inam.SK 29/03/2023
// written by Inam.SK 06/04/2023

class Flight {
  
  String destination ; 
  String origin ;
  String carrier ;
  int flightNumber ;
  int distance; 
  String date ; 
  int actualArrivalTime ; 
  int schdArrivalTime ;
  
  Flight()
  {
    print("hi");
  }
  
  Flight(String destination , String origin , String carrier , int flightNumber , int distance , String date , int actualArrivalTime , int schdArrivalTime ){
    
    this.destination = destination ;
    this.origin = origin ; 
    this.carrier = carrier ; 
    this.flightNumber = flightNumber ; 
    this.distance = distance ;
    this.date = date ; 
    this.actualArrivalTime = actualArrivalTime ;
    this.schdArrivalTime = schdArrivalTime ; 
    
    
  }
  

  
  
}
