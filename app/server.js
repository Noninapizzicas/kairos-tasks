const express = require('express');
const app = express();
const http = require('http').createServer(app);
const io = require('socket.io')(http);
const path = require('path');

app.use(express.static(path.join(__dirname, 'public')));

const PORT = process.env.PORT || 3000;
http.listen(PORT, () => {
    console.log(`Servidor ejecutándose en puerto ${PORT}`);
});
