/*


*/

class TraficLightControler{
  
  final private int numberOfNormalState=8;
  final private int faultState=8;
  
  private int state;
  private TraficLight voieA,voieB;
  private Timer  chronometer;
  private  boolean panic;        // true si un défaut est détecté 
  
  private final int[][] states= {
    {0,4},
    {0,1},
    {0,2},
    {0,0},
    {4,0},
    {1,0},
    {2,0},
    {0,0},
    {3,3},  // panic, tous éteint
    {2,2}   // panic, les deux feux orange
    };
    
  private final int[] timings= {5,10,1,1,5,10,1,1,1,1};

  // Constructeur -----------------------------------------------
  TraficLightControler(){
    state=-1;
    panic=false;
    voieA=new TraficLight();
    voieB=new TraficLight();
    chronometer=new Timer();
    changeState();
    } // fin du constructeur

  // Méthode changeState =========================================
  void  changeState(){
    state=(state+1) % numberOfNormalState;
    if (panic) {
      state=faultState+(state % 2);
      }
    voieA.changeState(states[state][0]);
    voieB.changeState(states[state][1]);
    chronometer.start(timings[state]);
    }
    
  // Méthode draw ================================================
  void draw(int x,int y) {
    voieA.draw(x,y);
    voieB.draw(x+80,y);
    if (!chronometer.eval())
      changeState();
    }

  // Méthode faultDetected========================================    
 void  faultDetected(){
   panic=true;
   changeState();
   }

  // Méthode faultCorrected ======================================    
 void  faultCorrected(){
   panic=false;
   changeState();
   }
    
}