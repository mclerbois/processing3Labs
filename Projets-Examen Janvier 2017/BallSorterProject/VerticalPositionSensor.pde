

public class VerticalPositionSensor extends Actor implements Runnable {
  private Actor target;
  private Indicator led;
  private int y1,y2;
  
  
  public VerticalPositionSensor(String[] imageFileNames, int x, int y, int y1, int y2) {
    super(new String[]{}, x, y); // pas d'images
    led=new Indicator(imageFileNames,x,y);
    this.y1=y1;
    this.y2=y2;
  }
  
  public void attatch(Actor target) {
    this.target=target;
  }
  
  void run() {
    for (;; ) {
        state= (target!=null) ? (target.y>=y1)&&(target.y<y2) : false;
    try { 
      java.lang.Thread.sleep(samplingTime);
    }
    catch (Exception e) {
      println(e);
    }
  }
}
  
  
  void draw(){
    led.state=state;
    led.draw();
  }
}