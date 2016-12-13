


public class Indicator extends Actor  {

  public Indicator(String[] imageFileNames, int x, int y) {
    super(imageFileNames, x, y);
  }
  
  void draw() {
    image(state ? imgs[1] : imgs[0],x,y);
  }
}