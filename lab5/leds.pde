/*
*  Objet pour la gestion des diodes leds
*  M. Clerbois 
*  4 novembre 2015
*  Rev 1.0
*/

class led {

  private PImage ledOff;
  private PImage ledOn;
  private boolean state;
  private int xled;
  private int yled;
  
  led(String offImageFile,String onImageFile) {
    ledOff=loadImage(offImageFile);
    ledOn=loadImage(onImageFile);
    state=false;
    xled=0;
    yled=0;
    }
    
 led(String offImageFile,String onImageFile, int x, int y) {
    ledOff=loadImage(offImageFile);
    ledOn=loadImage(onImageFile);
    state=false;
    xled=x;
    yled=y;
    }
    
  void set() {
    state=true;
    }
    
  void clr() {
    state=false;
    }

  void toggle(){
    state=! state;
    }
  boolean get(){
    return state;
    }
  
  void locate(int x, int y){
    xled=x;
    yled=y;
    }
  
  void draw() {
    if (state) 
      image(ledOn,xled,yled);
    else
      image(ledOff,xled,yled);
    }
};