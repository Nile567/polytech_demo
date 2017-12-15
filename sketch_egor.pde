import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int  r = 300;
float x ;
float y ;
float x2 ;
float y2;
void setup()
{
 fullScreen();
  //size(600, 400);
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
  fill(#1A1F18, 20);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
  fill(-2, 25);
  stroke(-2, 150);
  int angel = player.bufferSize();
  for (int i = 0; i < angel - 1; i++)
  {
     x = (r)*cos(i*4*PI/angel);
     y = (r)*sin(i*4*PI/angel);
     x2 = (r + player.left.get(i)*300)*cos(i*4*PI/angel);
     y2 = (r + player.left.get(i)*300)*sin(i*4*PI/angel);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(-2, 150);
  endShape();
}

boolean FullScreen() {
  return true;
}
void keyPressed() {
  if(key==' ')exit();
}