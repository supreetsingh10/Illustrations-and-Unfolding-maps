//loading all images in the data folder
class Images {
  Images() {
    for(int i = 1; i<all_images.length; i++){
      all_images[i] = loadImage(i + ".jpg"); 
    }
  }

//to  display images of the city when clicked at x=0,y=0
  void show(int place){
    System.out.println(place);
    temp = all_images[place]; 
    temp.resize(1400, 1200); //to resize the image
    image(temp, 0, 0);   
  }
}






