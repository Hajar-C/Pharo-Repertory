# Rapport Week 2 Hajar

## What I did

- **CountryFlag** : Réalisation de l'application de carte interactive des pays. Extraction des tracés SVG depuis `world.svg` via `XMLParser`, manipulation graphique avec Roassal et conception de l'interface avec Spec2 (`EarthCountryBrowser`).
- **Lecture Preparation** : Visionnage des vidéos et étude des supports sur le modèle objet, la syntaxe Pharo et la priorité des messages.
- **Practice message dispatch** : Expérimentation pratique dans le Playground sur les mécanismes de dispatch, de lookup et de polymorphisme, puis analyse des résultats :

  1. **Ordre d'évaluation et précédence (`2 + 3 * 4`)** :
     - *Exemple :* Évaluation de `2 + 3 * 4`.
     - *Attente vs Réalité :* En venant de langages comme C/Java, on s'attend mathématiquement à `14`. Pharo renvoie `20`.
     - *Explication :* En Pharo, `+` et `*` sont des messages binaires de même priorité envoyés successivement de gauche à droite (`(2 + 3) * 4`). Pour forcer la priorité, l'usage des parenthèses est obligatoire (`2 + (3 * 4)`).

  2. **Identité d'objet : `self == super`** :
     - *Exemple :* Évaluation de `self == super`.
     - *Attente vs Réalité :* On pourrait intuitivement penser que `super` fait référence à une instance distincte de la superclasse. Le résultat obtenu est `true`.
     - *Explication :* `==` vérifie l'égalité d'identité physique en mémoire. `super` désigne exactement le même objet que `self`. La seule différence réside dans le point de départ du *lookup* (la recherche de méthode), qui commence statiquement dans la superclasse de la classe contenant la méthode en cours d'exécution.

  3. **Booléens et branchement conditionnel (`ifTrue:ifFalse:`)** :
     - *Exemple :* `true ifTrue: [ 'C''est vrai !' ] ifFalse: [ 'C''est faux !' ]`.
     - *Attente vs Réalité :* Dans les langages impératifs, le `if/else` est une instruction de contrôle native. En Pharo, le conditionnel n'existe pas en tant que mot-clé système : c'est un envoi de message polymorphe.
     - *Explication :* `True` et `False` sont deux sous-classes distinctes de `Boolean`. La méthode `ifTrue:ifFalse:` est implémentée différemment dans chacune : `True` évalue le bloc vrai (`trueBlock value`), tandis que `False` évalue le bloc faux (`falseBlock value`). Cela illustre le principe fondamental : *« Don't check, dispatch »*.

## What I did not

- **Practice -- Chess** : Je ne l'ai pas encore fini. 

## Difficulties & Solutions

- **Manipulation du SVG et Spec2** : L'adaptation des chemins vectoriels issus du fichier SVG vers les formes Roassal et la liaison avec la liste déroulante ont demandé un temps d'adaptation, notamment sur le cycle de vie des presenters (gestion du `model` dans le tri du `SpDropList`). L'utilisation de l'inspecteur a permis de corriger les erreurs de typage et de bien brancher l'affichage dynamique du drapeau.
- **Différence entre `Do it` et `Print it`** : Au départ, l'exécution avec `Do it` sur des expressions sans effet de bord ne renvoyait aucun retour visible. L'usage systématique de `Print it` (`Ctrl + P`) dans le Playground a permis de bien observer les valeurs retournées lors des tests de dispatch.
