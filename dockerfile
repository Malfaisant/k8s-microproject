# Utiliser l'image node.js 20 basée sur Alpine
FROM node:20-alpine

# Installer cURL
RUN apk add --no-cache curl

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json dans /app
COPY package*.json /app/

# Installer les dépendances npm
RUN npm install

# Copier tout le code source dans le conteneur
COPY . /app/

# Exposer le port de l'application
EXPOSE 3000

# Lancer l'application avec Node.js
CMD ["node", "app.js"]