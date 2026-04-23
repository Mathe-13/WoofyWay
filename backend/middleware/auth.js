const jwt = require('jsonwebtoken');

const verificarToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];

  // Formato esperado: "Bearer token"
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) {
    return res.status(401).json({ mensaje: 'Token no proporcionado.' });
  }

  jwt.verify(token, 'woofy_secreto', (err, usuario) => {
    if (err) {
      return res.status(403).json({ mensaje: 'Token inválido.' });
    }

    // Guardamos los datos del usuario en req para usarlos en la ruta protegida
    req.usuario = usuario;
    next();
  });
};

module.exports = verificarToken;
