import processing.video.*;

Capture video;

//color [] trackColor = {color(167), color(0)};
//float threshold = 25;

void setup() {
  size(640, 480);
  //String[] cameras = Capture.list();
 // printArray(cameras);
  video = new Capture(this, 640, 480);
  video.start();
  //tracking
  //trackColor = color(167);
  
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  //video.read();
  video.loadPixels();
  image(video, 0, 0);
  //filter(GRAY);
  filter(POSTERIZE,10);
  
  
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      float b =brightness(video.pixels[loc]);
      //float r1 = red(video.pixels[loc]);
      //float g1 = green(video.pixels[loc]);
      //float b1 = blue(video.pixels[loc]);
      //video.pixels[loc] = color(r1,g1,b1);
      
      
      if(b<=100) {video.pixels[loc] = color(#F016D7);}
      if (b>=100) {video.pixels[loc] =color(#FED715);}
      //if (b<=200) {video.pixels[loc] =color(#70BAFF);}
      //if (b>=200) {video.pixels[loc] =color(#0037B3);}
      

  
      
    }
  }

}
