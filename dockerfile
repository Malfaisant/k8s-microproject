# Utiliser l'image officielle de Node.js 22 basée sur Alpine
FROM node:22-alpine

# Installer cURL
RUN apk add --no-cache curl

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json dans /app
COPY package*.json /app

# Lister le contenu pour vérifier que package.json est bien copié
 

# Installer les dépendances npm
RUN npm install

# Copier tout le code source dans le conteneur
COPY . /app

# Exposer le port de l'application (ajuste en fonction du port utilisé par app.js)
EXPOSE 3000

# Lancer l'application avec Node.js
CMD ["node", "app.js"]