# Rapport Week 1

## What I did
- **ProfStef** : suivi du tutoriel interactif dans le Playground pour prendre en main la syntaxe et les messages.
- **Counter** : création de la classe `Counter` en TDD (méthodes `increment`, `decrement`, tests unitaires associés).
- **Dice (DSL)** : 
  - création des classes `Die` et `DieHandle` avec leurs tests (`roll`, `+`, `printOn:`).
  - extension de la classe `Integer` pour avoir la syntaxe `2 D20 + 3 D10`.
  - tous les tests sont au vert.

## What I did not
- **Country Flags** : pas encore fait, c'est la prochaine étape.
- **Chapitres bonus sur les dés (double dispatch)** : ignorés pour me concentrer sur les exercices demandés par le sujet.

## Difficulties & Solutions
- **Apprentissage et aide IA** : j'apprends beaucoup mieux avec des exemples visuels et concrets plutôt qu'avec de la théorie pure. Comme la syntaxe Smalltalk est très différente de ce que je connais, j'ai utilisé une IA pour me donner des exemples clairs afin de bien visualiser et comprendre le cours avant de coder.
- **Gestion des extensions de classe** : l'UI de Pharo ne me laissait pas taper l'étoile `*Dice`. J'ai compris qu'il fallait utiliser le dossier `extensions` de Pharo pour rattacher les méthodes d'`Integer` au bon package.
- **Iceberg / Git** : un peu de confusion au départ entre le nom du repo local, `origin` et comment ajouter un deuxième package (`Dice`) dans le même dépôt, résolu via l'interface d'Iceberg.
