/****************************************************************/
// implémentation de la classe abstraite

class myModel extends AbstractModel{

  /****************************************************************/
  // constructeur 
  public myModel() {
     binaryValues=new boolean[16]; // on déclare que le tableau contiendra  élément
     // mise à l'état false de toutes les valeurs binaires
     for (boolean b : binaryValues) 
       b=false;
    }
    
  /****************************************************************/
  // implémentation de la méthode abstraite change
  // elle reçoit deux paramètres, l'indice (index) du tableau et la valeur à donner 
  public void change(int index,boolean value){
    if ((index>=0) && (index<16)) { // si index n'est pas en dehors des bornes du tableau
      binaryValues[index]=value;    // on peut changer la valeur logique
      notifyObserver(index);        // on signal aux observers (vue) que quelque chose à changé
      }
    // on ne fait rien si l'index n'est pas valide
    }
    
  /****************************************************************/
  // implémentation de la méthode abstraite get
  //  elle reçoit un paramètre, l'indice (index) du tableau 
  public boolean get(int index){
    if ((index>=0) && (index<16)) { // si index n'est pas en dehors des bornes du tableau
      return binaryValues[index];   // on retourne la valeur demandée
      }
    return false;                   // on retourne toujours false si l'index n'est pas valide
  }
}

// lire ensuite l'onglet abstractControler