const express = require('express');
const cors = require('cors');
require('dotenv').config(); // ✅ Cargar variables desde .env

const app = express();
const PORT = process.env.PORT || 3000;

// ✅ Middlewares globales
app.use(cors());
app.use(express.json());

// ✅ Ruta de prueba para comprobar que el servidor responde
app.get('/', (req, res) => {
  res.send('🚀 API de Adiestramiento Canino funcionando');
});

// ✅ Rutas organizadas por módulo
app.use('/api/usuarios', require('./routes/usuarios'));
app.use('/api/perros', require('./routes/perros'));

// ✅ Captura de errores generales (404 por ejemplo)
app.use((req, res) => {
  res.status(404).json({ mensaje: 'Ruta no encontrada' });
});

// ✅ Arranque del servidor
app.listen(PORT, () => {
  console.log(`🚀 Servidor backend corriendo en http://localhost:${PORT}`);
});
