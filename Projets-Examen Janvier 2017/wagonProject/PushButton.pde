
public class PushButton extends Actor {
  private Indicator indicator;
  
  public PushButton(String[] imageFileNames, int x, int y) {
    super(new String[]{}, x, y); // pas d'images
    indicator=new Indicator(imageFileNames,x,y);
    w=indicator.w;
    h=indicator.h; // cbm
  }
  
  void draw(){
    indicator.state=state;
    indicator.draw();
  }
  
  
  
  void mousePressed(){
    if ((mouseX>x) && (mouseX<(x+w)) && (mouseY>y) && (mouseY<(y+h))) // cbm
      state=true;

    }

  void mouseReleased(){
    if ((mouseX>x) && (mouseX<(x+w)) && (mouseY>y) && (mouseY<(y+h))) // cbm
      state=false;
  }
}