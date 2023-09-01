# Projet Inception - 🐋 Docker Infrastructure Project

## 📋 Résumé

Ce projet a pour objectif de créer une infrastructure de plusieurs services à l'aide de Docker. Chaque service tourne dans son propre conteneur Docker et les images sont créées à partir de Dockerfiles personnalisés.

## 💻 Technologies Utilisées

- Docker
- Docker-compose
- NGINX TLSv1.2 ou TLSv1.3
- WordPress
- PHP-FPM
- MariaDB
- Debian 

## 📦 Installation
Modifier les variables d'environnement VOLUME_DB et VOLUME_WP
```bash
git clone https://github.com/Jeanmichel7/inception.git
cd inception && make
```

## 📜 Règle du Projet

- Chaque service doit tourner dans un conteneur Docker dédié.
- Interdiction d'utiliser des images Docker pré-faites ou des services tels que DockerHub, sauf pour Alpine et Debian.
- Les images Docker doivent être construites à partir de Dockerfiles personnalisés.
- Les conteneurs doivent redémarrer en cas de crash.
- Utilisation de variables d'environnement pour la configuration.

## 🛠️ Utilisation

Après l'installation, accédez à vos services en utilisant votre domaine personnalisé, qui pointe vers votre adresse IP locale. Par exemple:

```bash
https://jeanmichel7.42.fr
```

## 🌟 Bonus

- Mise en place de Redis Cache pour WordPress.
- Serveur FTP pointant vers le volume de votre site WordPress.
- Création d'un petit site statique dans le langage de votre choix.
