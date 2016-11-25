/****************************************************************/
// implémentation du controleur

public class myControler extends AbstractControler {
  private tempo myTempo;
  
  /****************************************************************/
  // constructeur
  public myControler(AbstractModel model){
    super(model);
    // démarre une temporisation de 500 millisecondes affectant l'élément binaire d'indice 13
    myTempo = new tempo(this,13,500);
  }
  
  /****************************************************************/
  // méthode de gestion 
  // implantation d'équation logique
  // (15) = (0) and (1)
  // (15) représente la valeur logique d'indice (index) 15
  
   protected void control(){
     // la valeur logique d'index 15 réalise une fonction ET avec celles d'index 0 et 1
     model.change(15,model.get(0) && model.get(1));
   }
  
  /****************************************************************/
   protected void restartTimer(int index,int duration){
     // changement d'état de la valeur logique (index)
     model.change(index,!model.get(index));
     // redémarrage de la temporisation
     myTempo = new tempo(this,index,duration);
     }
}

// Lire l'onglet swingvue