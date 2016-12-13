
public class Hook extends Actor implements Runnable {

  private Actor driver;
  
  public boolean up;
  public boolean down;

  private int upSpeed;
  private int downSpeed;
  public int speed;
  private int y0;

  public Hook(String imageFileName, int x, int y) {
    super(imageFileName, x, y);
    upSpeed=1;
    downSpeed=1;
    speed=0;
    y0=y;
  }

  void run() {
    for (;; ) {
      if (driver!=null) 
        x=driver.x;
      speed=0;
      if (up && !down)
        speed=-upSpeed;
      else
        if (!up && down)
          speed=downSpeed;
      y=y+speed;
    try { 
      java.lang.Thread.sleep(samplingTime);
    }
    catch (Exception e) {
      println(e);
    }
  }
}

void attach(Actor driver){
  this.driver=driver;
  x=driver.x;
  }
  
void draw() {
  super.draw();
  if (driver.y+driver.h<y) {
    line(x+w/2,driver.y+driver.h,x+w/2,y);
  }
}
}