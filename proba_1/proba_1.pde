import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int  r = 100;
float x ;
float y;
float x2 ;
float y2 ;
void setup()
{
  size(600, 400);
  minim = new Minim(this);
  player = minim.loadFile("D:/Downloads/gorillaz-dirty-harry-demon-days_(mp3CC.com).mp3");
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
  fill(-1, 10);
  stroke(-1, 50);
  int angle = player.bufferSize();
  for (int i = 0; i < angle - 1; i++)
  {
     x = (r)*cos(i*4*PI/angle);
     y = (r)*sin(i*4*PI/angle);
     x2 = (r + player.left.get(i)*200)*cos(i*4*PI/angle);
     y2 = (r + player.left.get(i)*200)*sin(i*4*PI/angle);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(-1, 50);
  endShape();

}

boolean FullScreen() {
  return true;
}