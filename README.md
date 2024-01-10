# Minitalk-42

## Description
Le projet Minitalk est une implémentation simple de la communication entre un client et un serveur en utilisant des signaux UNIX. Le client envoie un message au serveur en utilisant des signaux, et le serveur affiche ensuite le message reçu.

## Structure du Projet
Le projet est organisé de la manière suivante:

```
.
├── includes
│   └── minitalk.h
├── libs
│   ├── ft_printf
│   │   ├── includes
│   │   │   └── ft_printf.h
│   │   ├── Makefile
│   │   └── srcs
│   │       ├── ft_printf.c
│   │       ├── ft_printf_utils.c
│   │       ├── ft_print_hex.c
│   │       ├── ft_print_ptr.c
│   │       └── ft_print_unsigned.c
│   └── libft
│       ├── ft_is
│       │   ├── ft_isalnum.c
│       │   ├── ft_isalpha.c
│       │   ├── ft_isascii.c
│       │   ├── ft_isdigit.c
│       │   └── ft_isprint.c
│       ├── ... (autres modules libft)
│       ├── includes
│       │   └── libft.h
│       └── Makefile
├── Makefile
├── README.md
└── srcs
    ├── client
    │   └── client.c
    └── serveur
        └── serveur.c
```

Le projet contient un dossier `includes` pour les fichiers d'en-tête, un dossier `libs` avec les bibliothèques `ft_printf` et `libft`, un dossier `srcs` avec les fichiers source pour le client et le serveur, et un fichier `Makefile` pour la compilation du projet.

## Compilation
Pour compiler le projet, utilisez le fichier `Makefile` à la racine du projet. Exécutez la commande suivante dans le terminal:

```bash
make all
```or```bash
make re
```

Cela générera les exécutables `client` et `serveur` dans le répertoire racine.

## Utilisation
1. Exécutez le serveur:
   ```bash
   ./serveur
   ```
2. Exécutez le client avec le message à envoyer:
   ```bash
   ./client [PID_SERVEUR] "Votre message ici"
   ```

Le serveur affichera le message reçu du client.

## Auteur
sgabsi