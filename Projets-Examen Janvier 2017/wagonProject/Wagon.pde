


public class Wagon extends Actor implements Runnable {

  public boolean left;
  public boolean right;

  private int leftSpeed;
  private int rightSpeed;
  public int speed;

  public Wagon(String imageFileName, int x, int y) {
    super(imageFileName, x, y);
    leftSpeed=2;
    rightSpeed=1;
    speed=0;
  }

  void run() {
    for (;; ) {

      speed=0;
      if (left && !right)
        speed=-leftSpeed;
      else
        if (!left && right)
          speed=rightSpeed;
      x=x+speed;
    try { 
      java.lang.Thread.sleep(samplingTime);
    }
    catch (Exception e) {
      println(e);
    }
  }
}
}