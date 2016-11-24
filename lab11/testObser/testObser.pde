

// simulation d'un liaison électrique entre une sortie logique et une entrée logique
// sortie logique, binaryOutput
// entrée logique, binaryInput


void setup(){
      binaryOutput rbo = new binaryOutput(false); // le paramètre définit l'état initial
      binaryInput rbi = new binaryInput(rbo); // le paramètre définit la sortie auquel l'entrée est connectée
      
      // link rbo to rbi, on lie la sortie à une entrée (et non l'inverse)
      rbo.addObserver(rbi);
      
      print("Etat initial de l'entrée RBI ");
      println(rbi.get());
      print("Etat initial de la sortie RBO ");
      println(rbo.get());
      println();
      
      println("Changement d'état de la sortie RBO");
      rbo.set();
      print("Etat actuel de la sortie RBO ");
      println(rbo.get());
      print("Etat actuel de l'entrée RBI ");
      println(rbi.get());
      println();
      
      println("Changement d'état de la sortie RBO");
      rbo.toggle();
      print("Etat actuel de la sortie RBO ");
      println(rbo.get());
      print("Etat actuel de l'entrée RBI ");
      println(rbi.get());
      
      noLoop();
      exit();
}