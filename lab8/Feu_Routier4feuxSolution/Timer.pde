/*


*/

class Timer{
  
  private  boolean state;
  private  int  timeWhenStart;
  private  int  timeToWait;
  
  // Constructeur -----------------------------------------------
  Timer() {
    state=false;
    timeWhenStart=0;
    timeToWait=0;
    }

  // Méthode start ==============================================
  void start(int value) {
    state=true;
    timeToWait=value*1000;
    timeWhenStart=millis();
    }

    // Méthode eval ==============================================
  boolean  eval() {
      
    float t=(float)((timeToWait-(millis()-timeWhenStart))/100)/10;
      String s= Float.toString(t);
      fill(0);
      textSize(24);
      text(s,63,380);
      
      if (state)
        if ( (millis()-timeWhenStart)>timeToWait) {
          state=false;
          }
      return state;
    }
  
  }