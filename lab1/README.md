# Lab 1 #

## Mots clés à rechercher dans la référence ##

- final
- color(...)
- int
- void ...
- void setup()
- void draw()
- size(...)
- background(...)
- textSize(...)
- fill(...)
- println(...)
- text(...)
- framecount


## Questions ##


- Que fait ce programme ?
- Comment modifier la taille de la fenêtre graphique ?
- Comment modifier la couleur de fond ?
- Comment modifier la taille des caractères?
- Comment modifier la couleur des caractères?
- Comment afficher un message dans la console?
- Comment afficher un texte dans la fenêtre graphique ?

## Tests ##


- Remplacez la ligne <br/>
		<font color="red"><code>text("Hello",10,50);</code><br/></font> 
par <br/>
		<font color="blue"><code>text(frameCount,10,50);</code><br/></font> 

- L'affichage fonctionne-t-il correctement ?
- Remplacez le contenu de `void draw()` par 

<font color="red"><code>&nbsp;&nbsp;&nbsp;&nbsp;void draw() {<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background(myBackGroundColor);<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text(frameCount,10,50);<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</code></font>

- L'affichage fonctionne-t-il correctement ?



