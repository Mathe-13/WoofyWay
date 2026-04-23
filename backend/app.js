const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express(); // ✅ Aquí primero se crea 'app'

// Importar rutas después de crear 'app'
const usuariosRoutes = require('./routes/usuarios');
const perrosRoutes = require('./routes/perros');

// Middlewares
app.use(cors());
app.use(express.json());

// Rutas
app.use('/api/usuarios', usuariosRoutes);
app.use('/api/perros', perrosRoutes);

// Ruta de prueba
app.get('/', (req, res) => {
  res.send('¡WoofyWay backend funcionando! 🐶');
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});
