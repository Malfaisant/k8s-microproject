# Projet Kubernetes Node.js

Ce projet est une application Node.js déployée sur Kubernetes avec diverses fonctionnalités dont HTTPS, logging persistant, et haute disponibilité.

## Objectifs du projet

Cette application doit répondre aux exigences suivantes :
1. Liveness probe configurée
2. Support HTTPS via Ingress
3. Persistance des logs dans un PersistentVolume
4. Variables d'environnement dans un ConfigMap
5. Déploiement via StatefulSet

## Prérequis

- Docker installé et configuré
- Minikube installé
- kubectl installé
- Un compte Docker Hub
- Node.js v20 ou supérieur
- npm

## Installation et Configuration

1. Cloner le projet et installer les dépendances :
```bash
git clone https://github.com/Malfaisant/k8s-microproject.git
cd k8s-microproject
npm install
```

## lignes commandes pour tester

Appliquer toutes les configurations
- kubectl apply -f .

- Test Liveness probe
kubectl describe pod k8s-microproject-0 | grep Liveness

- Test HTTPS
curl -k https://k8s.local/

- Test healthcheck
curl -k https://k8s.local/healthz

- Test Persistance
kubectl exec k8s-microproject-0 -- cat /app/logs/access.log

- Test Varibale d'environnement
kubectl exec k8s-microproject-0 -- env | grep PORT

- Test Statefukset
kubectl get statefulset