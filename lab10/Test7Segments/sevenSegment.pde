/***************************************************************************************/
  public abstract class sevenSegment {
    
  protected PImage[] digits;     // les onze images des dix chiffres de 0 à 9 +  l'afficheur éteint
  final protected int blankIndex=16;
  final protected int dotIndex=17;
  final protected int minuxIndex=18;

  protected int tx;                     // position du coin supérieure droit de l'image           
  protected int ty;

  protected PGraphics digit;
  protected float  _scale;

  //===========================================================
  public sevenSegment(int tx, int ty, float _scale) {
    this._scale=_scale;
    this.tx=(int)((float)tx/_scale);
    this.ty=(int)((float)ty/_scale);
    digits= new PImage[19];
    digits[0]=loadImage("images/zero.png");
    digits[1]=loadImage("images/un.png");
    digits[2]=loadImage("images/deux.png");
    digits[3]=loadImage("images/trois.png");
    digits[4]=loadImage("images/quatre.png");
    digits[5]=loadImage("images/cinq.png");
    digits[6]=loadImage("images/six.png");
    digits[7]=loadImage("images/sept.png");
    digits[8]=loadImage("images/huit.png");
    digits[9]=loadImage("images/neuf.png");
    digits[10]=loadImage("images/a.png");
    digits[11]=loadImage("images/b.png");
    digits[12]=loadImage("images/c.png");
    digits[13]=loadImage("images/d.png");
    digits[14]=loadImage("images/e.png");
    digits[15]=loadImage("images/f.png");
    digits[16]=loadImage("images/blank.png");
    digits[17]=loadImage("images/dot.png");
    digits[18]=loadImage("images/minus.png");
  }

  //===========================================================
  protected abstract void buildDigit();

  //===========================================================
  public void draw() {
    pushMatrix();
    scale(_scale);
    image(digit, tx, ty);
    popMatrix();
  }

  //===========================================================
  public void setRbi(boolean value) {};
  //===========================================================
  public boolean getRbo() {return false;};
  //===========================================================
  public void setDot(boolean value) {};
  //===========================================================
  public void change(int newValue) {};
  //===========================================================
  public void change(boolean newValue) {};
  //===========================================================
  public color getColor() {return color(70,97,138);};
  //===========================================================
  public int getWidth() {return (int)((float)digit.width * _scale);}
  //===========================================================
  public int getheight() {return (int)((float)digit.height * _scale);}
} // fin de l'objet





/***************************************************************************************/

public  class  minusDigit extends sevenSegment {
  private boolean minusDigit;
  
  /***************************************************************************************/
  // constructeur
  public minusDigit(int tx, int ty, float _scale) {
    super(tx, ty, _scale); 
    minusDigit=false;   
    buildDigit();
  }

  /***************************************************************************************/
  // Création de l'image du digit
  protected void buildDigit() {
    digit = createGraphics(digits[0].width, digits[0].height);
    digit.beginDraw();
    if (minusDigit) 
      digit.image(digits[minuxIndex], 0, 0);
    else 
    digit.image(digits[blankIndex], 0, 0);
    digit.endDraw();
  }

  /***************************************************************************************/
  // afficher ou non le signe moins
  public void change(boolean newValue) {
    if (minusDigit!=newValue) {
      minusDigit=newValue;
      buildDigit();
    }
  }
} // fin de l'objet




/***************************************************************************************/
public  class  numberDigit extends sevenSegment{

  // les propriétés de l'objet  
  private int      number;        // mémorise la valeur à afficher

  private boolean  rbi;      // si rbi est true alors l'afficheur n'affiche pas le chiffre 0, il utilise l'image de l'afficheur éteint
  private boolean  rbo;      // si rbi est true et que la valeur à afficher vaut zéro, rbo est true (pour l'affichage qui se trouve à sa gauche)
  private boolean  dot;     // état du point décimal

  /***************************************************************************************/
  // constructeur
  public numberDigit(int tx, int ty, float _scale) {
    super(tx,ty,_scale);
    rbi=false;
    dot=false;
    number=0;
    buildDigit();
  }

  /***************************************************************************************/
  // Création de l'image du digit
  protected void buildDigit() {
    digit = createGraphics(digits[0].width, digits[0].height);
    digit.beginDraw();
    if (rbi && (number==0) && (!dot)) {
      digit.image(digits[blankIndex], 0, 0);
      rbo=true;
    } else {
      digit.image(digits[number], 0, 0);
      rbo=false;
    }
    if (dot)
      digit.image(digits[dotIndex], 0, 0);
    digit.endDraw();
  }

  /***************************************************************************************/
  // modification de la valeur de rbi
  void setRbi(boolean value) {
    if (rbi==value)
      return; // il n'y pas de changement dont rien à faire
    rbi=value;
    if (number==0) 
      buildDigit();
    else
      rbo=false; // par de propagation du blanking car chiffre affiché car différent de 0
  }

  /***************************************************************************************/
  // modification de la valeur de dot
  void setDot(boolean value) {
    if (dot==value)
      return; // il n'y pas de changement dont rien à faire
    dot=value;
    buildDigit();
  }


  /***************************************************************************************/
  // modification de la valeur du chiffre
  void change(int newValue) {
    newValue=newValue%16;
    if (number!=newValue) {
      number=constrain(newValue, 0, 11); // permet de contraindre la valeur de number
      buildDigit();
    }
  }
  
  public boolean getRbo() {
    return rbo;
  }
} // fin de l'objet