ScreenPosition click; 
double nearest_lat, nearest_long;
double input_lat, input_long; 
double diff_lat, diff_long; 
int img_number; 

class Interact {


  //To get better accurucy of the markers  insted of float - double has been used to get the value to 4 decimal points
  //This function is created to get the location of the click on the sketch, if mouse pressed 
  //inside the marker then the image will show up therefore we need to understand the relationship of the click on screen with the lattitude and longitude by dist. formula 
 
  void nearest(Location input_location) {
    diff_lat = Double.MAX_VALUE; 
    diff_long = Double.MAX_VALUE; 
    nearest_lat = Double.MAX_VALUE; 
    nearest_long = Double.MAX_VALUE; 
    input_lat = input_location.getLat();
    input_long = input_location.getLon();
    double lowest_distance = Double.MAX_VALUE; 
    double distance; 
    double refx, refy; 
    for (int i = 1; i<locations.length; i++) {
      Location l = locations[i]; 
      refx = input_lat - l.getLat(); 
      refx = refx * refx; 
      refy = input_long - l.getLon(); 
      refy = refy * refy; 
     
     //We can rewrite the Pythagorean theorem as d=√((x_2-x_1)²+(y_2-y_1)²) to find the distance between any two points
      distance = Math.sqrt(refx + refy);  // Used distance formula the calculate the nearest location to the click. 
      if (distance < lowest_distance) {   // to get the distance of the nearest click from the lat and long of from the csv
        nearest_lat = l.getLat(); 
        nearest_long = l.getLon();
        lowest_distance = distance;
      }
    }
    which_place(nearest_lat, nearest_long, input_location);
  }
  void which_place(double x, double y, Location input_location) {  // Used the this to track down which is the nearest place to the click  
    for (int i = 1; i < locations.length; i++) {
      if (x == locations[i].getLat()) {
        valid_click(i, input_location);
      }
    }
  }
  void valid_click(int place, Location input_location) {   //Used this to check if the click is in the marker.
    Images im = new Images();

    ScreenPosition nearest_place_on_screen = on_screen[place]; // On_screen has 
    SimplePointMarker simp = new SimplePointMarker(input_location); 
    ScreenPosition position_clicked = simp.getScreenPosition(map);
    float coord_x, coord_y; 
    coord_x = position_clicked.x - nearest_place_on_screen.x; 
    coord_y = position_clicked.y - nearest_place_on_screen.y; 
    if (((coord_x > -30) && (coord_x < 30))&&((coord_y > -30) && (coord_y < 30))) {
      //System.out.println("WOW" + " " + place); 
      im.show(place);
    } else {
      System.out.println("NO");// if the mouse clicked is not inside the markers then print out "NO"
    }
  }
}

