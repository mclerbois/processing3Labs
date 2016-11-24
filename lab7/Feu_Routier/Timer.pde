/*


*/

class Timer{
  
  private  boolean state;
  private  long  timeWhenStart;
  private  long  timeToWait;
  
  // Constructeur -----------------------------------------------
  Timer() {
    state=false;
    timeWhenStart=0;
    timeToWait=0;
    }

  // Méthode start ==============================================
  void start(long value) {
    state=true;
    timeToWait=value*1000;
    timeWhenStart=millis();
    }

    // Méthode eval ==============================================
  boolean  eval() {
      if (state)
        if ( (millis()-timeWhenStart)>timeToWait) {
          state=false;
          }
      return state;
    }
  
  }