Exemple d'objet simulant le fonctionnement d'une diode led

- constructeur
  public <b>ledClass</b>(String ledOffFile, String ledOnFile) {... }
  
- fonction de dessin
  public void draw(int x,int y){...}
  
- fonction pour allumer la diode led
  public void on() {...}
    
- fonction pour éteindre la diode led
  public void off() {...}
  
- fonction pour changer l'état de la diode led
  public void toggle() {...}
    
- fonction pour changer l'état la diode led
  public void change(boolean newState) {...}
    
- fonction pour lire l'état de la diode
  public boolean state() {...}
