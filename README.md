# Dead V Zombie - Serveur FiveM

![FiveM Banner](img/fivem_banner.gif)

![Wallpaper](img/wallpaper.jpg)

## Un mode de jeux roleplay survie, apocalypse zombie.

## Frameworks

- ESX Legacy
- OX Core

## Prérequis

- FiveM Server
- MySQL Server
- Un compte FiveM avec une clé de licence valide

## Installation

1. Clonez ce dépôt dans votre dossier de serveur FiveM
2. Importez le fichier `database.sql` dans votre base de données MySQL
3. Copiez le fichier `server.cfg.example` vers `server.cfg`
4. Configurez votre fichier `server.cfg` :
   - Remplacez `your_license_key` par votre clé de licence FiveM
   - Configurez la connexion MySQL : `set mysql_connection_string "mysql://user:password@localhost/database_name?charset=utf8mb4"`
   - Configurez vos administrateurs en remplaçant les identifiants FiveM

## Configuration

1. Modifiez les paramètres du serveur dans `server.cfg` :
   - Nom du serveur
   - Description
   - Nombre maximum de joueurs
   - Tags
   - Locale

2. Configuration des ressources :
   - Configurez les ressources individuelles dans leurs dossiers respectifs
   - Ajustez les paramètres de l'inventaire dans `@ox_inventory/config.cfg`

## Démarrage

1. Assurez-vous que MySQL est en cours d'exécution
2. Lancez le serveur avec `run.cmd` (Windows) ou `run.sh` (Linux)

## Notes de sécurité

- Ne partagez jamais votre clé de licence FiveM
- Protégez vos identifiants de base de données
- Utilisez des mots de passe forts pour MySQL
- Sauvegardez régulièrement votre base de données

## Support

Pour obtenir de l'aide, contactez moi sur Discord ou ouvrez une issue sur GitHub.
