import java.util.Observer;
import java.util.Observable;

// utilisation de l'interface Observer
// l'entrée observe la sortie auquel elle est connectée

// entrée logique
public class binaryInput implements Observer {
   private boolean state=false;      // état de l'entrée logique
   
   private binaryOutput ov = null;   // sortie logique auquel est connecté cette entrée
   
   // constructeur 
   public binaryInput(binaryOutput ov) {
      this.ov = ov;  // on mémorise la sortie logique connectée 
   }
   // méthode qui doit être implémentée car dans définie dans l'interface Observer
   public void update(Observable obs, Object obj)   {
      if (obs == ov){ // si l'objet qui signal un changement est bien celui attendu
         state=ov.get();
      }
   }
   
   public boolean get() { return state;} // retourne l'état de l'entrée logique
}