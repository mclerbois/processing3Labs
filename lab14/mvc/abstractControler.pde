/*

 Classe abstraite de gestion d'un controleur
 
 */


public abstract class AbstractControler {

  // modèle de données utilisé par le controleur
  protected AbstractModel model;

  // constructeur lie le modèle au controleur
  public AbstractControler(AbstractModel model){
    this.model = model;   
   }
 
  // un événement généré par la vue communique celui-ci au controleur
  // qui à son tour le communique au modèle
  // et réévalue la fonction de contrôle
  public void change(int index,boolean value){
    this.model.change(index,value);            // transmet les infos de changement au modèle (qui fait le nécessaire)
    control();  // exécute la fonction de contrôle, des équations logiques par exemple
    };
    
  // un événement généré par la vue communique celui-ci au controleur
  // qui à son tour le communique au modèle
  // ici on demande au modèle une valeur qui sera fournie à la vue
  public boolean get(int index){
    return this.model.get(index);
  };
   
  //Méthode de contrôle, gestion d'équations logiques
  abstract protected void control();
  abstract protected void restartTimer(int index,int duration);
}

// Lire l'onglet myControler