const express = require('express');
const router = express.Router();
const usuariosController = require('../controllers/usuariosController');
const verificarToken = require('../middleware/auth');

// Registro
router.post('/registro', usuariosController.registrarUsuario);

// Login
router.post('/login', usuariosController.loginUsuario);

// Ruta protegida de prueba
router.get('/perfil', verificarToken, (req, res) => {
  res.json({
    mensaje: 'Acceso autorizado',
    usuario: req.usuario
  });
});

module.exports = router;
