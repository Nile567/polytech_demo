import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int  r = 250;
float x ;
float y;
float x2 ;
float y2 ;
void setup()
{
  fullScreen();
 // size(600, 400);
  minim = new Minim(this);
  player = minim.loadFile("D:/Downloads/architects-memento-mori-2016_(mp3CC.com).mp3");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.loop();
  noCursor();
}
void draw()
{ 
  beat.detect(player.mix);
  fill(#dbdbdb, 20);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
  fill(-10, 30);
  stroke(10, 30);
  int angle = player.bufferSize();
  for (int i = 0; i < angle; i++)
  {
     x = (r)*cos(i*4*PI/angle);
     y = (r)*sin(i*4*PI/angle);
     x2 = (r - player.right.get(i)*275)*cos(i*4*PI/angle);
     y2 = (r - player.right.get(i)*275)*sin(i*4*PI/angle);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(10, 30);
  endShape();
}
boolean FullScreen() {
  return true;
}
void keyPressed() {
 if(key==' ')exit(); 
}