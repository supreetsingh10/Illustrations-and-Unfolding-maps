//Line markers is using an inbuilt functions to create LINES on the map - the colours of the SimpleLinesMarker 
//IS SET UP AS PER CONTINENTS - ASIA-Purple,Europe-Red,North.A-Green.
class line_maar{
  Location Mumbai = locations[1];
  List<Marker> around_the_world = new ArrayList<Marker>(); 
  Random rand = new Random();
  SimpleLinesMarker s[] = new SimpleLinesMarker[19]; 
  void connect(){
   
     SimpleLinesMarker s[]= new SimpleLinesMarker[19];  
    for(int i = 0; i< locations.length; i++){
      s[i] = new SimpleLinesMarker(Mumbai, locations[i]); 
    } 
    for(int i = 1; i < locations.length; i++){
      if(i < 8){
        s[i].setColor(color(120, 10, 200)); 
      }if((i >= 8) && (i < 12)){
        s[i].setColor(color(240, 50, 10)); 
      }if(i >= 12){
        s[i].setColor(color(50, 150, 100)); 
      } 
      around_the_world.add(s[i]);  
   }
 map.addMarkers(around_the_world);  
}
  
}
