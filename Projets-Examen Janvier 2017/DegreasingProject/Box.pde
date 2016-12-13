
public class Box extends Actor {
  public boolean visible;
  private Actor driver;

  public Box(String imageFileName, int x, int y) {
    super(imageFileName, x, y);
    visible=true;
  }


void attach(Actor driver) {
  this.driver=driver;
  x=driver.x;
  y=driver.y;
}

void draw() {
  if (visible && (driver!=null)) {
    x=driver.x;
    y=driver.y+driver.h;
    super.draw();
  }
}

}