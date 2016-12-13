public class  Tank extends Actor implements Runnable {
  private int level;
  private Actor inValve;
  private Actor outValve;
  
  private  float conicBase=240;
  private  float conicHeight=70;
  private  float cylinderBase=240;
  private  float cylinderHeight=180;
  private  float surface;
  private  float conicVolume;
  private  float cylinderVolume;
  private  float tvolume;
  private  float volume;
  
  public Tank(String[] imageFileNames, int x, int y) {
    super(new String[]{}, x, y); // pas d'images          }
    surface=3.14159*conicBase*conicBase/4;
    conicVolume=surface*conicHeight/3;
    cylinderVolume=surface*cylinderHeight;
    tvolume=conicVolume+cylinderVolume;
    volume=0;
  }
  
  public void attatch(Actor inValve, Actor outValve) {
    this.inValve=inValve;
    this.outValve=outValve;
  }
  
  void run() {
    for (;; ) {
        if (inValve!=null && outValve!=null) {
            volume=volume+(inValve.state ? 3200 : 0) + (outValve.state ? -9000 : 0);
        if (volume<0)
            volume=0;
        if (volume>tvolume)
            volume=tvolume;
        if (volume<conicVolume) {
            level=(int)(volume/surface*3);
            }
        else {
            level=(int)(conicHeight+(volume-conicVolume)/surface);
            }
        if (level>124) level=124;
        if (level<0) level=0;
        value=level;
        }
    try { 
      java.lang.Thread.sleep(samplingTime);
    }
    catch (Exception e) {
      println(e);
    }
  }
}
  
  
  void draw(){
    fill(color(255,0,0));
    rect(x,y-level,3,level);
  }
}