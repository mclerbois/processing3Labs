/*
*  Objet pour la gestion de switch
*  M. Clerbois 
*  4 novembre 2015
*  Rev 1.0
*/

class _switch extends twoStateImage{

  private int width;
  private int height;
  
  _switch(String offImageFile,String onImageFile) {
    super(offImageFile,onImageFile);
    width=offImage.width;
    height=onImage.height;
    }
    
 _switch(String offImageFile,String onImageFile, int x, int y) {
    super(offImageFile,onImageFile,x,y);
    width=offImage.width;
    height=onImage.height;
    }
    
 
  boolean isMouseOver(int x, int y) {
    return ( (x>=this.x) && (x<=(this.x+width)) && (y>=this.y) && (y<=(this.y+height)));
    }
    
};