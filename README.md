# 🐋 Docker Infrastructure Project

Ce projet vise à approfondir les compétences en Docker en mettant en œuvre une mini-infrastructure de services sur une machine virtuelle.

## Introduction

L'objectif principal est de virtualiser plusieurs images Docker au sein d'une nouvelle machine virtuelle personnelle.

## Consignes générales

- Interdiction d'utiliser des images Docker pré-faites ou des services tels que DockerHub, sauf pour Alpine et Debian.
- Tous les éléments doivent être placés dans une machine virtuelle.
- Rendu de tous les fichiers de configuration dans un dossier `srcs`.
- Utilisation d'un Makefile pour automatiser la configuration.

## Architecture de l'infrastructure

L'infrastructure mise en place se compose des éléments suivants :

- **NGINX**: Un serveur web sécurisé avec TLSv1.2 ou TLSv1.3.
- **WordPress + php-fpm**: Dans un conteneur séparé de NGINX.
- **MariaDB**: Hébergé dans son propre conteneur, indépendant de NGINX.
- **Volumes**: Pour la persistance des données de WordPress.
- **Réseau Docker**: Facilitant la communication entre les différents conteneurs.

## Fonctionnalités bonus

Cette section comprend des améliorations et des extensions de l'infrastructure principale, notamment :

- **Redis**: Pour optimiser la gestion du cache WordPress.
- **Serveur FTP**: Fournissant un accès direct au volume de WordPress.
- **Site statique**: Démonstration des compétences en développement web (hors PHP).
