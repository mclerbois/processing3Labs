/*

*/

TraficLightControler tf;

void setup(){
  size(400,400);
  tf= new TraficLightControler();
  } // fin void setup()

void draw(){  
  background(color(255,255,255));
  tf.draw(0,0);
  } // fin void draw()
  
  
void  mousePressed()
{
  if (mouseButton==LEFT)
    tf.faultDetected();
  if (mouseButton==RIGHT)
    tf.faultCorrected();
}