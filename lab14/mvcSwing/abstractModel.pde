/*

   Classe abstraite de gestion d'un modèle
 
 */

import java.util.ArrayList;
import java.util.Observer;
import java.util.Observable;

/****************************************************************/
abstract class AbstractModel extends Observable {
  // Les données, tableau de valeurs binaires
  protected boolean[]  binaryValues;  
  
  // Les objets observer (une ou plusieurs vues)
  private ArrayList<Observer> listObserver = new ArrayList<Observer>(); 

  /****************************************************************/
  // ajouter un observer à la liste (une vue)
  public void addObserver(Observer obs) {
    this.listObserver.add(obs);
  }

  /****************************************************************/
  // communication d'un changement de données aux observers (les vues)
  public void notifyObserver(int  index) {
      for (Observer obs : listObserver)
        obs.update(this,index);
  }

  /****************************************************************/
  // retirer un observer (une vue) de la liste (rarement nécessaire)
  public void removeObserver() {
    listObserver = new ArrayList<Observer>();
  }
  
  // méthode abstraite créer par les descendants de cette classe abstraite
  
  /****************************************************************/
  // une des valeurs logique a changé
  public abstract void change(int index,boolean value);
  
  /****************************************************************/
  // que vaut une valeur logique en particulier
  public abstract boolean get(int index);
  
}

// Lire l'onglet myModel qui contient un implémentation de la classe abstraite