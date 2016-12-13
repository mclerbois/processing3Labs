
public class Trap extends Actor implements Runnable {

  public boolean airFlow;

  private int direction;
  private int leftSpeed;
  private int rightSpeed;
  public int speed;
  private int x0, xf;

  public Trap(String imageFileName, int x, int y) {
    super(imageFileName, x, y);
    leftSpeed=8;
    rightSpeed=-8;
    speed=0;
    x0=x;
    xf=x+55;
    direction=-1;
  }

  void run() {
    for (;; ) {

      speed=0;
      if (airFlow)
        speed=-leftSpeed*direction;
      else
        speed=rightSpeed*-direction;
      x=x+speed;
      if (x<x0) {
        x=x0;
        state=true;
      }
      if (x>xf) {
        x=xf;
        state=false;
      }
      try { 
        java.lang.Thread.sleep(samplingTime);
      }
      catch (Exception e) {
        println(e);
      }
    }
  }
}