

// afficheur afficheur
// on affiche 4 chiffres avec une décimale soit -123.4 [S] [A] [B] [C.] [D]
// [S] index = 0
// [A] index = 1
// [B] index = 2
// [C] index = 3
// [D] index = 4
sevenSegment[] digits;

float myScale=0.25;  // echelle utilisée 
float n=-111.1;      // variable pour générer des nombres

void setup(){
  size(300,100);

  // création de l'afficheur
  digits=new sevenSegment[5];
  digits[0]=new minusDigit(10,10,myScale); // signe
  for (int i=1;i<5;i++) {
    digits[i]=new numberDigit(10+i*digits[0].getWidth(),10,myScale);
    }
  digits[3].setDot(true);
}

// dessine tout
void draw(){
  background(digits[0].getColor());
  floatToDisplay(n);
  drawDisplay();
  n=n+0.1;
}

// converti un float en un tableau d'afficheur 7 segments
void floatToDisplay(float n){
  int c;
  int k=abs((int)(n*10.0));
  k=abs((int)(n*10.0));
  digits[0].change(n<0.0); // signe

  for (int i=4;i>0;i--) {
      c=k%10;
      digits[i].change(c); 
      k=k/10;
    }
  digits[1].setRbi(true);
  for (int i=2;i<5;i++)
    digits[i].setRbi(digits[i-1].getRbo());
}

// dessine les afficheurs
void drawDisplay() {
  for(int i=0;i<5;i++)
    digits[i].draw();
}