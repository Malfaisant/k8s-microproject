const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Fonction pour logger les accès
const logAccess = (req, res, next) => {
    const log = `${new Date().toISOString()} - ${req.method} ${req.url}\n`;
    fs.appendFile(path.join('/app/logs', 'access.log'), log, (err) => {
        if (err) console.error('Error writing to log:', err);
    });
    next();
};

// Middleware pour logger tous les accès
app.use(logAccess);

// Route de base
app.get('/', (req, res) => {
    res.send('Hello, Kubernetes!');
});

//Ajout de la route /healthz
app.get('/healthz', (req, res) => {
    res.status(200).send('OK');
});

// Lancement du serveur
app.listen(PORT, '0.0.0.0', () => {
    console.log(`App listening at http://0.0.0.0:${PORT}`);
});