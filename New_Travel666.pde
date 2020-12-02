import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*; 
import de.fhpotsdam.unfolding.data.GeoJSONReader;
import java.util.*;
import java.lang.Math; 
import de.fhpotsdam.unfolding.marker.Marker;
import de.fhpotsdam.unfolding.marker.AbstractMarker;
import de.fhpotsdam.unfolding.marker.SimplePointMarker;
import processing.core.PApplet;
import de.fhpotsdam.unfolding.data.Feature;
import de.fhpotsdam.unfolding.marker.SimpleLinesMarker; 




UnfoldingMap map;

Interact In;

Places Place;

String travel;


//Simple Point marker function is an inbuilt function of the library and the [19] is the number of marker I want to create 
//SimplePointMarker home; 
SimplePointMarker been_there[] = new SimplePointMarker[19]; 
//SimpleLinesMarker linee[] = new SimpleLinesMarker[19]; 
ScreenPosition on_screen[] = new ScreenPosition[19]; 
//ScreenPosition onScreen;
Location clicked;  

//Array of 19 images for 19 cities in the csv
PImage all_images[] = new PImage[19]; 
PImage temp; 


int igm = 0;

//Travel history is the csv data to be loaded for city names and location
String Travel_History[];
String lat_long[][]; 
Location locations[] = new Location[19]; 

//Class Geo_Markers
Geo_Markers geo[] = new Geo_Markers[19];


void setup() { 
  //im.All_images(); 
  Places pun = new Places();
  //interact inter = new interact();  
  pun.something(); 
  pun.marked();

  //Screen Size 
  size(1400, 1200); 


  //Declaring the map provider for interactive map 
  map = new UnfoldingMap(this, new OpenStreetMap.OpenStreetMapProvider()); 
  MapUtils.createDefaultEventDispatcher(this, map);
  pun.been_There();
}

void settings() {
  System.setProperty("jogl.disable.openglcore", "false");
}


void make_Markers() {
  for (int i = 1; i < 18; i++) {
    on_screen[i] = been_there[i].getScreenPosition(map);
  }
}

void display() {  
  //ellipse(geo[1].onScreen.x, geo[1].onScreen.y, 36, 36); 
  for (int i = 1; i < 18; i++) {  
    if(i < 7){
        ellipse(on_screen[i].x, on_screen[i].y, 36, 36);
        stroke(0);
        strokeWeight(2);
        fill(color(120, 10, 200)); 
      }else if((i >= 7) && (i < 11)){
        ellipse(on_screen[i].x, on_screen[i].y, 36, 36);
        stroke(0);
        strokeWeight(2);
        fill(color(240, 50, 10)); 
      }else if(i >= 11){
        ellipse(on_screen[i].x, on_screen[i].y, 36, 36);
        stroke(0);
        strokeWeight(2); 
        fill(color(50, 150, 100)); 
      } 
  }
}

void draw() {
  map.draw();

  frameRate(20);

  pushMatrix();

  //strokeWeight(15);

  //Line Maker factory

  line_maar coc = new line_maar();



  Interact In = new Interact(); 
  //Images m = new Images();
  //stroke(69, 211, 227, 100); 
  //noFill(); 
   fill(color(120, 10, 200));
 


  make_Markers();


  display(); 


  coc.connect(); 

   popMatrix();
  if (mousePressed) {
    clicked = map.getLocation(mouseX, mouseY); 
    In.nearest(clicked); 
    //System.out.println("You crazy if this works"); 
    //interaction(mouseX, mouseY, home_loc.x, home_loc.y);
  }
}

