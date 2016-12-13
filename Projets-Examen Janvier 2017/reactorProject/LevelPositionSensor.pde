

public class  LevelPositionSensor extends Actor implements Runnable {
  private int level;
  private Actor target;
  private Indicator led;
  
  
  public LevelPositionSensor(String[] imageFileNames, int x, int y,int level) {
    super(new String[]{}, x, y); // pas d'images
    led=new Indicator(imageFileNames,x,y);
    this.level=level;
  }
  
  public void attatch(Actor target) {
    this.target=target;
  }
  
  void run() {
    for (;; ) {
        state= (target!=null) ? (target.value>=level) : false;
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