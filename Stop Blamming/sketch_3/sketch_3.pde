PImage img;
int spacing=20;
float mx=0;
float my=0;
float px=mx;
float py=my;
import processing.sound.*;
Amplitude amp;
AudioIn in;

AudioIn input;
Amplitude loudness;

void setup() {
  size(960, 540);
  img = loadImage("04.jpg");
  
    amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

}

void draw() {
  image(img, 0, 0);
  
  mx+=(px-mx)*0.01;
  my+=(py-my)*0.01;
  for (float x=mx-50; x<mx+50; x+=spacing) {
    for (float y=my-50; y<my+50; y+=spacing) {
      color c=img.get(int(x), int(y));
      fill(c);
      noStroke();
      rect(x, y, spacing, spacing);
      
      if (amp.analyze()>0.009 && px==610 && py==400){
        px=150;
      py=120;
}
else{px=610;
py=400;}
}
      println(amp.analyze());
    }
  }
