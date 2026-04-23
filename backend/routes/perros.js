const express = require('express');
const router = express.Router();
const verificarToken = require('../middleware/auth');
const perrosController = require('../controllers/perrosController');

// Obtener el perfil del perro del usuario
router.get('/', verificarToken, perrosController.obtenerPerfilPerro);

// Crear o actualizar el perfil del perro del usuario
router.post('/', verificarToken, perrosController.guardarPerfilPerro);

module.exports = router;
