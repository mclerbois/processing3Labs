public class Actor{
  protected PImage img;
  protected PImage[] imgs;
  protected int x,y;
  protected int w,h;
  public   boolean state;
  public   int value;  // cbm
  
  public Actor(String imageFileName, int x, int y) {
      imgs=null;
      img=loadImage(imageFileName);
      w=img.width;
      h=img.height;
      this.x=x;
      this.y=y;
    }
    
  public Actor(String[] imageFileNames, int x, int y) {
      if (imageFileNames.length>0) {
        imgs=new PImage[imageFileNames.length];
        for (int i=0;i<imageFileNames.length;i++) {
          imgs[i]=loadImage(imageFileNames[i]);
          }
        img=imgs[0];
        w=img.width;
        h=img.height;
      }
      this.x=x;
      this.y=y;
    }
    
  public void draw() {
    image(img,x,y);
    }
  
  public boolean isInside(int x1,int y1, int x2, int y2) {
    return ( (x>=x1) && (x<=x2) && (y>=y1) && (y<=y2));
  }
  
  public boolean isX(int x){
    return ( (this.x+w/10<x) && ((this.x+9*w/10)>x) );
  }
  
  public boolean isY(int y){
    return ( (this.y+h/10<=y) && ((this.y+9*h/10)>=y) );
  }
}