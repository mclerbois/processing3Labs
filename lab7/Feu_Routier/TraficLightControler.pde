/*


*/

class TraficLightControler{
  
  private int state;
  private TraficLight voieA,voieB;
  private Timer  chronometer;
  private  boolean panic;        // true si un défaut est détecté 
  
  private final int[][] states= {
    {0,1},
    {0,2},
    {0,0},
    {1,0},
    {2,0},
    {0,0},
    {3,3},  // panic, tous éteint
    {2,2}   // panic, les deux feux orange
    };
    
  private final int[] timings= {15,5,1,15,5,1,1,1};

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
    state=(state+1) % 6;
    if (panic) {
      state=6+(state % 2);
      }
    voieA.changeState(states[state][0]);
    voieB.changeState(states[state][1]);
    chronometer.start((long)timings[state]);
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