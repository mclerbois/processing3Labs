
/* gestion de l'interface graphique et des entrées sortie */
// Cette classe implément l'interface Observer (La fonction update)

public class vue implements Observer {
  
  private boolean hasChange=true; // provoque le rafraichissement de l'écran
  
  
  
  // controleur connecté à cette vue
  protected AbstractControler controler;
  
  private int lastDraw; // instant du dernier rafraichissement de l'écran

  // constructeur
  public vue(AbstractControler controler) { 
    this.controler=controler;
  }

  // un événement propoqué par la vue est communiqué au controleur qui ...
  public void change(int index, boolean value) {
    this.controler.change(index, value);
  }

  // une demande de lecture de la vue passe par le contrôleur
  public boolean get(int index) {
    return this.controler.get(index);
  }

  // La mise à jour est simple dans ce cas, on autorise le rafraichissement de l'écran
  public void update(Observable obs, Object obj) {
    hasChange=true;
    if ((int)obj==13) { // si la valeur logique d'indice 13 à changé, c'est à cause de la tempo
    // la sortie 11 recopie le complément de la 13
      change(11,!get(13)); // 11 recopie 13
      }
  }

  // méthode pour rafraichir l'écrant
  public void draw() {
    if (!hasChange)
      return;
    hasChange=false;
    background(200);
    stroke(255);
    for (int i=0; i<16; i++) {
      if (i<10)
        fill(myVue.get(i) ? color(255, 0, 0): color(40, 0, 0));
      else
        fill(myVue.get(i) ? color(0, 255, 0): color(0, 40, 0));
      rect(40*i, 0, 40, 40);
      fill(0);
      text(i, 20+40*i, 60);
    }
    text("Interval de temps entre deux Draw",10,80);
    text(millis()-lastDraw,300,80);
    lastDraw=millis();
  }

  // méthode pour gérer le click de la souris
  void mouseClicked() {
    int index=mouseX/40;
    if (index<10){
      myVue.change(index, !myVue.get(index));
    }
  }
}

/*

  Un click de souris à l'écran provoque :
  
    1 - l'appel de la fonction mouseClicked() dans l'onglet mvc
    2 - cet événement provoque l'appel de la fonction myVue.mouseClicked()
    3 - si on a agit sur l'un des 10 premiers carrés, on invoque myVue.change(index,value)
    4 - myVue.change(...) demande au controleur de s'en occupper, this.controler.change(...)
    5 - this.controler.change(...) demande au modèle de s'en occuper this.model.change(...) 
        et exécute le fonction controler() les équations logiques
    6 - this.model.change(...) on modifie les données la valeur logique spécifié
        ensuite on signale (notifyObserver(index)) au observers (les vues) que des choses on changé, des états logiques
    7 - notifyObserver(index) provoque l'exécution de la méthode update(...) de myVue.
    8 - update(...) de myVue provoque le rafraichissement de l'écran hasChange=true;


*/