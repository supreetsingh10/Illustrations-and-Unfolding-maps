

// The class is created to returnthe on screen positions of the Cities from the data files

class Geo_Markers{
  //ScreenPosition onScreen;
  ScreenPosition placer(SimplePointMarker z){
    ScreenPosition onScreen = z.getScreenPosition(map);
    return onScreen;
  }
}
