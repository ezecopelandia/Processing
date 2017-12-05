import org.openkinect.processing.*;

Kinect2 kinect2;

void setup() {
 size(512,424);
 kinect2 = new Kinect2(this);
 kinect2.initDepth();
 kinect2.initDevice();
}

void draw(){
  background(0);
  //Save the depth data extrated from the camera in img
  PImage img = kinect2.getDepthImage();
  image(img,0,0);

  //skip 10 pixels
  int skip = 10;
  for (int x = 0; x < img.width; x+= skip){
    for (int y = 0; y < img.height; y+= skip){
      int index = x + y * img.width;
      float b = brightness(img.pixels[index]);

      fill(b);
      rect(x,y,skip,skip);
    }
  }
}
