- Les données du programme sont définies dans un fichier nommé defs.json
- la couleur de fond, la position et les noms de fichiers images utilisés ne sont plus figés dans le programme mais bien dans une fichier texte editable.
- Si on ajoute des fonctions de configuration interactive le programme pourrait modifier le fichier defs.json et donc l'aspect de la fenêtre.


- contenu du fichier defs.json
```
{
  "backGroundColor" : 200,
  "LedA": {
    "x": 250,
    "y": 100,
    "offImage": "ledGreenOff8.png",
    "onImage": "ledGreenOn8.png"
  },
  "LedB": {
    "x": 280,
    "y": 100,
    "offImage": "ledGreenOff8.png",
    "onImage": "ledGreenOn8.png"
  },
  "swA": {
    "x": 10,
    "y": 10,
    "offImage": "swOff.png",
    "onImage": "swOn.png"
  },
  "swB": {
    "x": 110,
    "y": 10,
    "offImage": "swOff.png",
    "onImage": "swOn.png"
  }
}
```
