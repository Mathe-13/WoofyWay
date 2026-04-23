const pool = require('../db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// REGISTRO
const registrarUsuario = async (req, res) => {
  const { nombre, email, contrasena } = req.body;
  console.log('📨 Petición recibida en /registro:', req.body);

  try {
    const existe = await pool.query('SELECT * FROM usuarios WHERE email = $1', [email]);
    if (existe.rows.length > 0) {
      return res.status(400).json({ mensaje: 'El correo ya está registrado.' });
    }

    const hash = await bcrypt.hash(contrasena, 10);

    const nuevoUsuario = await pool.query(
      'INSERT INTO usuarios (nombre, email, contrasena) VALUES ($1, $2, $3) RETURNING *',
      [nombre, email, hash]
    );

    res.status(201).json({
      mensaje: '✅ Usuario registrado con éxito.',
      usuario: nuevoUsuario.rows[0],
    });
  } catch (error) {
    console.error('❌ Error al registrar usuario:', error);
    res.status(500).json({ mensaje: 'Error al registrar usuario.' });
  }
};

// LOGIN
const loginUsuario = async (req, res) => {
  const { email, contrasena } = req.body;
  console.log('📥 Intento de login con:', email, contrasena);

  try {
    const resultado = await pool.query('SELECT * FROM usuarios WHERE email = $1', [email]);

    if (resultado.rows.length === 0) {
      return res.status(404).json({ mensaje: 'Usuario no encontrado.' });
    }

    const usuario = resultado.rows[0];
    console.log('🔐 Usuario encontrado:', usuario);

    console.log('➡️ Contraseña enviada por usuario:', contrasena);
    console.log('⬅️ Contraseña (hash) en BD:', usuario.contrasena);

    const contrasenaValida = await bcrypt.compare(contrasena, usuario.contrasena);
    if (!contrasenaValida) {
      return res.status(401).json({ mensaje: 'Contraseña incorrecta.' });
    }

    const token = jwt.sign(
      { id: usuario.id, email: usuario.email },
      'woofy_secreto',
      { expiresIn: '1h' }
    );

    res.json({
      mensaje: 'Login exitoso.',
      token,
      usuario: {
        id: usuario.id,
        nombre: usuario.nombre,
        email: usuario.email
      }
    });
  } catch (error) {
    console.error('❌ Error al iniciar sesión:', error);
    res.status(500).json({ mensaje: 'Error al iniciar sesión.' });
  }
};

module.exports = {
  registrarUsuario,
  loginUsuario
};
