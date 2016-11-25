//import processing.core.PApplet;

// Une tâche est un descendant d'une class java Thread

public class tempo extends Thread {
   private int duration=0;                   // durée de la tempo
   private AbstractControler controler;
   private int binaryElementIndex;
   // constructeur
   public tempo(AbstractControler controler,int binaryElementIndex,int duration) {
     this.controler=controler;
     this.binaryElementIndex=binaryElementIndex;
     this.duration=duration;
     this.start(); // on démarre la tempo
     }
     
   // fonction exécuté après le start()
   public void run() {
       try {
         Thread.sleep(duration); // faire dodo 
       }
       catch (Exception e) {
         System.out.println(e);
       }
      controler.restartTimer(binaryElementIndex,duration);
   }
}