import processing.video.*;

Capture video;

color [] trackColor={color(0),color(57),color(87),color(167),color(209),color(255)};
float threshold = 25;

void setup() {
  size(600, 600);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, 600, 600, "FaceTime HD Camera (Built-in)");
  video.start();
  //tracking, add more colours to this list for it to track more, doesn't make colours different though
  //frameRate(30);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);
  //filter(GRAY);
  // this controls how close to the shade camera colours need to be to be tracked
  // higher number = more pixels shaded, less true to tracking
  //lower number = truer to tracked color 
  threshold = 250;

  float avgX = 0;
  float avgY = 0;

  int count = 0;
  
     

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r0 = red(currentColor);
      float g0 = green(currentColor);
      float b0 = blue(currentColor);
      
      float r1 = red(trackColor[0]);
      float g1 = green(trackColor[0]);
      float b1 = blue(trackColor[0]);
      
      float r2 = red(trackColor[1]);
      float g2 = green(trackColor[1]);
      float b2 = blue(trackColor[1]);
      
      float r3 = red(trackColor[2]);
      float g3 = green(trackColor[2]);
      float b3 = blue(trackColor[2]);
      
      
      float r4 = red(trackColor[3]);
      float g4 = green(trackColor[3]);
      float b4 = blue(trackColor[3]);
      
      float r5 = red(trackColor[4]);
      float g5 = green(trackColor[4]);
      float b5 = blue(trackColor[4]);
      
      float r6 = red(trackColor[5]);
      float g6 = green(trackColor[5]);
      float b6 = blue(trackColor[5]);
      
      

      float d1 = distSq(r0, g0, b0, r1, g1, b1); 
      float d2 = distSq(r1, g1, b1, r2, g2, b2);
      float d3 = distSq(r2, g2, b2, r3, g3, b3);
      float d4 = distSq(r3, g3, b3, r4, g4, b4);
      float d5 = distSq(r4, g4, b4, r5, b5, g5);
      float d6 = distSq(r5, g5, b5, r4, g4, b4);
      
      //this is what determines the colour of the tracked pixels
      //the trick to independent colours is somewhere in this if statement
      //but where?
      
      avgX += x;
      avgY += y;
      count++;
      
      if (d1 < threshold*threshold) {
        stroke(#FE0879);
        strokeWeight(4);
        point(x,y);
        }
      if (d2 < threshold*threshold){
        stroke(#FF82E2);
        strokeWeight(4);
        point(x, y);
        
       if (d3 < threshold*threshold){
        stroke(#FED715);
        strokeWeight(4);
        point(x, y);
        
       if (d4 < threshold*threshold){
        stroke(#FFA02A);
        strokeWeight(4);
        point(x, y);
        
       if (d5 < threshold*threshold){
        stroke(#0037B3);
        strokeWeight(4);
        point(x, y);
        
       if (d6 < threshold*threshold){
        stroke(#70BAFF);
        strokeWeight(4);
        point(x, y);
        
      
       }}}}}
    }}  }





float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}
