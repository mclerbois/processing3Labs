/*
*  Objet pour la gestion des diodes leds
*  M. Clerbois 
*  4 novembre 2015
*  Rev 1.0
*/

class twoStateImage {

  protected PImage offImage;
  protected PImage onImage;
  private boolean state;
  protected int x;
  protected int y;
  
  twoStateImage(String offImageFile,String onImageFile) {
    offImage=loadImage(offImageFile);
    onImage=loadImage(onImageFile);
    state=false;
    locate(0,0);
    }
    
  twoStateImage(String offImageFile,String onImageFile, int x, int y) {
    offImage=loadImage(offImageFile);
    onImage=loadImage(onImageFile);
    state=false;
    locate(x,y);
    }
    
  void on() {    state=true;    }
    
  void off() {    state=false;    }

  void toggle(){    state=! state;    }
  
  boolean get(){    return state;    }
  
  void locate(int x, int y){
    this.x=x;
    this.y=y;
    }
  
  void draw() {
    if (state) 
      image(onImage,x,y);
    else
      image(offImage,x,y);
    }
};