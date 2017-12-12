import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int  r = 300;
float rad = 100;
void setup()
{
 fullScreen();
  //size(600, 400);
  minim = new Minim(this);
  player = minim.loadFile("D:/Downloads/gorillaz-dirty-harry-demon-days_(mp3CC.com).mp3");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.loop();
  noCursor();
}

void draw()
{ 
  float t = map(mouseX, 0, width, 0, 1);
  beat.detect(player.mix);
  fill(#1A1F18, 20);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
  fill(-2, 25);
  stroke(-2, 150);
  int bsize = player.bufferSize();
  for (int i = 0; i < bsize - 1; i++)
  {
    float x = (r)*cos(i*4*PI/bsize);
    float y = (r)*sin(i*4*PI/bsize);
    float x2 = (r + player.left.get(i)*300)*cos(i*4*PI/bsize);
    float y2 = (r + player.left.get(i)*300)*sin(i*4*PI/bsize);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(-2, 150);
  endShape();
}

boolean flag =false;
void mousePressed() {
  if (dist(mouseX, mouseY, width/2, height/2)<150) flag =!flag;
}
boolean FullScreen() {
  return true;
}