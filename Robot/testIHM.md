15/03/2024
IN210 - Test et validation de logiciel
Travaux Pratique - Test d'IHM

# Système automatique
(avec Robot Framework)
Le code est disponible dans le fichier testIHM.robot

## Question 1 
###  Quel est l’intérêt du Test Setup et du testdown ?
- Test Setup initialise l'environnement, le préparant ainsi pour une exécution optimale du test. Vous devez y inclure toutes les tâches à effectuer avant le début du test.
- Le Teardown est ce qui s'exécute après l'exécution du test, dans le but de ramener l'environnement à son état initial. Cela garantit qu'un test n'affecte pas l'exécution du suivant.

## Question 2
### Si on met le close browser à la fin du test et qu’une des commandes précédentes échouent que se passe-t-il ?

Si la commande pour fermer le navigateur est placée à la fin d'un test sans être dans Teardown, elle ne sera pas exécutée si l'une des commandes précédentes échoue. Cela se produit car lorsqu'un test rencontre une erreur, il renvoie l'erreur et interrompt son exécution.

## Question 3
### Quel locator aller vous choisir relatif ou absolu ? Pourquoi ?
Le choix du localisateur relatif a été fait en raison de sa plus grande flexibilité pour gérer les changements pouvant survenir sur le site Web, le rendant ainsi plus robuste face aux modifications de la structure HTML sous-jacente du site.

## Question 4
### Quel est l’intérêt de ces mots-clefs ?
L'objectif d'utiliser des "Keywords" est de rendre le code plus lisible en combinant des commandes pour une tâche simple avec des noms descriptifs. Cela facilite également les modifications et les corrections qui pourraient être nécessaires ultérieurement, rendant ainsi le code plus facile à entretenir. De plus, les keywords permettent de réutiliser des morceaux de commandes qui peuvent être utilisés dans d'autres tests ou avec différents paramètres.

## Question 5
### Quelle approche de test utilise-t-on : Record-Replay, Structured, Data-driven, Keyword
Une approche orientée par Keywords a été adoptée, où les tests sont écrits en utilisant des mots-clés significatifs qui décrivent l'action en cours d'exécution. Les actions sont encapsulées à la fois dans des mots-clés fournis par la bibliothèque SeleniumLibrary et dans des mots-clés personnalisés.

command: robot testIHM.robot