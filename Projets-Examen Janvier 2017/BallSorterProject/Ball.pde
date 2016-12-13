
public class Ball extends Actor implements Runnable {
  private int index;
  private int phase;
  private int x0,y0;
  
  public  boolean upper;
  public  boolean lower;
  public  boolean pusher;
  
  public Ball(String[] imageFileNames, int x, int y) {
    super(imageFileNames, x, y);
    index=(int)(random(100)/50);
    img=imgs[index];
    phase=0;
    x0=x;
    y0=y;
    value=index;
  }
  
  void reBorn(){
    x=x0;
    y=y0;
    index=(int)random(100)%2;
    img=imgs[index];
    phase=0;
    value=index;
  }

  void run() {
    for (;; ) {
      switch(phase) {
        case 0:
          if (upper)
            phase=1;
          break;
        case 1:
          if (y<y0+64)
            y++;
          else
            phase=2;
          break;
        case 2:
          if (lower)
            phase=3;
          break;
        case 3:
        if (y<y0+176)
            y++;
          else
            phase=4;
          break;
        case 4:
          if (pusher) {
            x--;
            y++;
            if (y>520)
              phase=5;
          }
          else {
            y++;
            if (y>325)
              phase=6;
          }
          break;
          case 5:
            reBorn();
            break;
          case 6:
            x++;
            y++;
            if (y>520)
              phase=5;
            break;
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