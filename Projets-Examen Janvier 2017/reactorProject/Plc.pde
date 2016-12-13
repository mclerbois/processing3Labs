//***************************************************************************
public class ShiftRegister_Relay { // relay temporisé
  
  public   boolean clock;
  
  public   boolean b0;
  public   boolean b1;
  public   boolean b2;
  public   boolean b3;
  public   boolean b4;
  public   boolean b5;
  public   boolean b6;
  public   boolean b7;
  public   boolean b8;
  public   boolean b9;
  public   boolean b10;
  public   boolean b11;
  public   boolean b12;
  public   boolean b13;
  public   boolean b14;
  public   boolean b15;

  public ShiftRegister_Relay() {
    b0=b1=b2=b3=b4=b5=b6=b7=b8=b9=b10=b11=b12=b13=b14=b15=false;
  }
  
  public void load (int value) {
    b0=(value &1)!=0;
    b1=(value &2)!=0;
    b2=(value &4)!=0;
    b3=(value &8)!=0;
    b4=(value &16)!=0;
    b5=(value &32)!=0;
    b6=(value &64)!=0;
    b7=(value &128)!=0;
    b8=(value &256)!=0;
    b9=(value &512)!=0;
    b10=(value &1024)!=0;
    b11=(value &2048)!=0;
    b12=(value &4096)!=0;
    b13=(value &8192)!=0;
    b14=(value &16384)!=0;
    b15=(value &32768)!=0;  
  }

  public boolean run (boolean data,boolean clock,boolean reset) {
    boolean pulse=clock & !this.clock;
    this.clock=clock;
    if (reset) {
      b0=b1=b2=b3=b4=b5=b6=b7=b8=b9=b10=b11=b12=b13=b14=b15=false;
      }
     else {
       if(pulse) {
         b15=b14;
         b14=b13;
         b13=b12;
         b12=b11;
         b11=b10;
         b10=b9;
         b9=b8;
         b8=b7;
         b7=b6;
         b6=b5;
         b5=b4;
         b4=b3;
         b3=b2;
         b2=b1;
         b1=b0;
         b0=data;
       }
     }
    return b0;
  }
}


//***************************************************************************
public class RisingEdge_Relay { // relay temporisé

  public   boolean coil;
  public   boolean contact;

  public RisingEdge_Relay() {
    coil=false;
  }

  public boolean run (boolean state) {
    boolean pulse=state & !coil;
    coil=state;
    contact=pulse;
    return contact;
  }
}

//***************************************************************************
public class FalingEdge_Relay { // relay temporisé

  public   boolean coil;
  public   boolean contact;

  public FalingEdge_Relay() {
    coil=false;
  }

  public boolean run (boolean state) {
    boolean pulse=!state & coil;
    coil=state;
    contact=pulse;
    return contact;
  }
}


//***************************************************************************
public class TIM_Relay { // relay temporisé

  public   boolean coil;
  public   boolean contact;
  private  int duration;

  public TIM_Relay() {
    coil=false;
  }

  public boolean run (boolean state, int duration) {
    if (state) {
      if (coil) {
        if (this.duration>0)
          this.duration--;
        contact=(this.duration>0);
      } else {
        contact=true;
        this.duration=duration;
        coil=true;
      }
    } else {
      coil=false;
      contact=false;
      this.duration=0;
    }
    return contact;
  }
}

//***************************************************************************
public class COUNT_Relay { // relay temporisé

  public   boolean coil;
  public   boolean contact;
  private  int countValue;
  private  int count;
  private  boolean running;

  public COUNT_Relay() {
    coil=false;
    contact=false;
    running=false;
    count=0;
    countValue=0;
  }

  public boolean run (boolean state, boolean reset, int countValue) {
    if (reset) {
      coil=false;
      contact=false;
      running=false;
      count=0;
      countValue=0;
    } else {
      boolean pulse=state & !coil; // détection de flanc montant
      coil=state;
      if (running) {
        if (pulse) {
          count++;
          if (count>=this.countValue) {
            count=this.countValue;
            contact=false;
          }
        }
      } else {
        if (pulse) {
          this.countValue=countValue;
          count=1;
          contact=true;
          running=true;
        }
      }
    }

    return contact;
  }
}


//***************************************************************************
public class Plc extends Actor {

  final int numberOfInputs=8;
  final int numberOfOutputs=8;

  final int[][] inputLightCoords= new int[][]{
    {0, 0, 8, 4}, 
    {0, 11, 8, 4}, 
    {0, 22, 8, 4}, 
    {0, 33, 8, 4}, 
    {22, 0, 8, 4}, 
    {22, 11, 8, 4}, 
    {22, 22, 8, 4}, 
    {22, 33, 8, 4}
  };


  final int[][] outputLightCoords= new int[][]{
    {102, 0, 8, 4}, 
    {102, 11, 8, 4}, 
    {102, 22, 8, 4}, 
    {102, 33, 8, 4}, 
    {124, 0, 8, 4}, 
    {124, 11, 8, 4}, 
    {124, 22, 8, 4}, 
    {124, 33, 8, 4}
  };

  final int offsetX=314;
  final int offsetY=35;

  public boolean inputs[]=new boolean[numberOfInputs];
  public boolean outputs[]=new boolean[numberOfOutputs];
  public boolean memo[]=new boolean[numberOfInputs]; //cbm
  
  public TIM_Relay tim1=new TIM_Relay();
  public TIM_Relay tim2=new TIM_Relay();
  public TIM_Relay tim3=new TIM_Relay();
  public TIM_Relay tim4=new TIM_Relay();
  public TIM_Relay tim5=new TIM_Relay();
  public TIM_Relay tim6=new TIM_Relay();
  public TIM_Relay tim7=new TIM_Relay();
  public TIM_Relay tim8=new TIM_Relay();
  
  public COUNT_Relay cnt1=new COUNT_Relay();
  public COUNT_Relay cnt2=new COUNT_Relay();
  public COUNT_Relay cnt3=new COUNT_Relay();
  public COUNT_Relay cnt4=new COUNT_Relay();
  public COUNT_Relay cnt5=new COUNT_Relay();
  public COUNT_Relay cnt6=new COUNT_Relay();
  public COUNT_Relay cnt7=new COUNT_Relay();
  public COUNT_Relay cnt8=new COUNT_Relay();
  
  public ShiftRegister_Relay sht1=new ShiftRegister_Relay();
  public ShiftRegister_Relay sht2=new ShiftRegister_Relay();
  public ShiftRegister_Relay sht3=new ShiftRegister_Relay();
  public ShiftRegister_Relay sht4=new ShiftRegister_Relay();
  public ShiftRegister_Relay sht5=new ShiftRegister_Relay();
  public ShiftRegister_Relay sht6=new ShiftRegister_Relay();
  public ShiftRegister_Relay sht7=new ShiftRegister_Relay();
  public ShiftRegister_Relay sht8=new ShiftRegister_Relay();
  
  
  public RisingEdge_Relay difu1=new RisingEdge_Relay();
  public RisingEdge_Relay difu2=new RisingEdge_Relay();
  public RisingEdge_Relay difu3=new RisingEdge_Relay();
  public RisingEdge_Relay difu4=new RisingEdge_Relay();
  public RisingEdge_Relay difu5=new RisingEdge_Relay();
  public RisingEdge_Relay difu6=new RisingEdge_Relay();
  public RisingEdge_Relay difu7=new RisingEdge_Relay();
  public RisingEdge_Relay difu8=new RisingEdge_Relay();
  
  
  public FalingEdge_Relay difd1=new FalingEdge_Relay();
  public FalingEdge_Relay difd2=new FalingEdge_Relay();
  public FalingEdge_Relay difd3=new FalingEdge_Relay();
  public FalingEdge_Relay difd4=new FalingEdge_Relay();
  public FalingEdge_Relay difd5=new FalingEdge_Relay();
  public FalingEdge_Relay difd6=new FalingEdge_Relay();
  public FalingEdge_Relay difd7=new FalingEdge_Relay();
  public FalingEdge_Relay difd8=new FalingEdge_Relay();
  

  public Plc(String imageFileName, int x, int y) {
    super(imageFileName, x, y);
  }

  void draw() {
    super.draw();
    for (int i=0; i<numberOfInputs; i++) {
      fill(color(inputs[i] ? 255 : 80, 0, 0));
      rect(offsetX+x+inputLightCoords[i][0], offsetY+y+inputLightCoords[i][1], +inputLightCoords[i][2], +inputLightCoords[i][3]);
    }

    for (int i=0; i<numberOfOutputs; i++) {
      fill(color(outputs[i] ? 255 : 80, 0, 0));
      rect(offsetX+x+outputLightCoords[i][0], offsetY+y+outputLightCoords[i][1], +outputLightCoords[i][2], +outputLightCoords[i][3]);
    }
  }

  void run() {
    actorsToPlc(inputs);  // lecture des entrées produites par les acteurs

    // déclaration de variables locales, copie des entrées et des sorties
    boolean start=inputs[0];        // entrée
    //boolean leftSensor=inputs[1];    // entrée
    //boolean rightSensor=inputs[2];    // entrée
    //boolean toLeft=outputs[0];    // sortie
    //boolean toRight=outputs[1];   // sortie
    //Boolean T1; // contact tim1

    // Equations
    //toRight=(start & leftSensor | toRight) & !rightSensor;
    //T1=tim1.run(rightSensor, 500);
    //toLeft=(rightSensor & !T1 | toLeft) & !leftSensor;

    // test du compteur, difu et difd
    //outputs[6]=cnt1.run(start,rightSensor,5); // compte le nombre d'activation du bouton start reset par rightSensor
    //outputs[5]=difu1.run(start);
    //outputs[4]=difd1.run(start);
    
    // mise à jour des sorties de l'automate
    outputs[0]=start;
    outputs[1]=stopButton.state;
    //outputs[1]=toRight;
    //outputs[7]=T1; // pour afficher l'état du relay temporisé

    plcToActors(outputs); // action sur les acteurs
  }
}