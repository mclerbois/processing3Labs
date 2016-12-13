

public class HorizontalPositionSensor extends Actor implements Runnable {
  private Actor target;
  private Indicator led;
  
  
  public HorizontalPositionSensor(String[] imageFileNames, int x, int y) {
    super(new String[]{}, x, y); // pas d'images
    led=new Indicator(imageFileNames,x,y);
  }
  
  public void attatch(Actor target) {
    this.target=target;
  }
  
  void run() {
    for (;; ) {
        state= (target!=null) ? target.isX(x) : false;
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