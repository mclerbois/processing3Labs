import java.util.Observer;
import java.util.Observable;

// Héritage de la class Observable
// la sortie signale aux éléments de la classe observable que celle-ci vient de changer

public class binaryOutput extends Observable {
   private boolean state=false; // état de la sortie logique
   
   // constructeur
   public binaryOutput(boolean state){
      this.state = state;
   }
   
   // méthode permettant de changer l'état de la sortie
   public void change(boolean state) {
     if (this.state==state)
       return;                // il ne sert à rien de signaler que l'état n'a pas changé
      this.state=state;;
      setChanged();           // c'est deux lignes provoqueront la mise à jour de l'entrée logique connectée
      notifyObservers();
   }
   
   public void clr() { change(false); }  // mise à 0
   public void set() { change(true); }   // mise à 1
   public void toggle() {change(!get());} // changement d'état
   
   public boolean get(){ return this.state; } // lecture de l'état logique
}