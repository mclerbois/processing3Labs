import processing.core.PApplet;

// Une tâche est un descendant d'une class java Thread

public class shortApp extends Thread {
   int py;                                // position verticale du cercle
   String name;                           // nom de la tâche
   int numberOfLoops=0;                   // nombre de boucles à réaliser
   
   // constructeur
   public shortApp(String name, int numberOfLoops) {
     this.py=0;
     this.name=name;
     this.numberOfLoops=numberOfLoops;
     this.start(); // on démarre la tâche.
     }
     
   // fonction exécuté après le start()
   public void run() {
     //System.out.println("App Start "+name);
     for(int i=0;i<numberOfLoops;i++) {
       //System.out.println(" * App "+name+" "+Integer.toString(i));

         py=i; // modification de l'ordonnée du cercle dessiné.

       try {
         //Thread.sleep(10); // faire dodo 10mSec, laisser le temps ou autres tâches de fonctionner
         // mettre en commentaire la ligne ci-dessus
         // tester le programme
         // retirer les commenataies de la ligne ci-dessous
         Thread.sleep(numberOfLoops/100); // faire dodo 10mSec, laisser le temps ou autres tâches de fonctionner
       }
       catch (Exception e) {
         System.out.println(e);
       }
     }
     //System.out.println("App Stop "+name);
   }
}