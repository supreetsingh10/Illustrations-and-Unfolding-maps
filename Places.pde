class Places{
  
  //Loading data from the csv file , the array has [5] seperated values
  
  
  void something(){
    Travel_History = loadStrings("Travel_History.csv");   
    lat_long = new String[Travel_History.length][5]; 
    for(int i = 0 ; i < Travel_History.length; i++){
      lat_long[i] = Travel_History[i].split(","); 
    }
  }
  
  // The 3rd and the 4th values of the csv file indicate the Latitude and Longitude cities I have visited
  
  void marked(){
    for(int i = 1; i<lat_long.length; i++){
      float x, y; 
      
      
      //Changes the string to float so that the values can be reused as required in this case for markers and interaction
      
      x = Float.parseFloat(lat_long[i][3]); 
      y = Float.parseFloat(lat_long[i][4]); 
      locations[i] = new Location(x,y); 
    }
   /* for(int i = 1; i<lat_long.length; i++){
      System.out.println(locations[i].x + " " + locations[i].y);
    }*/
  }
  void been_There(){
     //home = new SimplePointMarker(mumbai);
     for(int i = 1; i < lat_long.length; i++){
       been_there[i] = new SimplePointMarker(locations[i]); 
     }
  }
}
