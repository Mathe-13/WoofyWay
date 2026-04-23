const pool = require('../db');

// Obtener el perfil del perro del usuario autenticado
const obtenerPerfilPerro = async (req, res) => {
  const usuarioId = req.usuario.id;

  try {
    const resultado = await pool.query(
      'SELECT * FROM perros WHERE usuario_id = $1 LIMIT 1',
      [usuarioId]
    );

    if (resultado.rows.length === 0) {
      return res.status(404).json({ mensaje: 'No hay perfil del perro creado.' });
    }

    res.json(resultado.rows[0]);
  } catch (error) {
    console.error('❌ Error al obtener el perfil del perro:', error);
    res.status(500).json({ mensaje: 'Error al obtener el perfil del perro.' });
  }
};

// Crear o actualizar perfil del perro
const guardarPerfilPerro = async (req, res) => {
  const usuarioId = req.usuario.id;
  const { nombre, raza, edad } = req.body;

  try {
    const existe = await pool.query(
      'SELECT * FROM perros WHERE usuario_id = $1',
      [usuarioId]
    );

    if (existe.rows.length > 0) {
      // Si ya existe, actualiza
      const actualizado = await pool.query(
        'UPDATE perros SET nombre = $1, raza = $2, edad = $3 WHERE usuario_id = $4 RETURNING *',
        [nombre, raza, edad, usuarioId]
      );
      return res.json({ mensaje: 'Perfil del perro actualizado.', perro: actualizado.rows[0] });
    } else {
      // Si no existe, crea uno nuevo
      const nuevo = await pool.query(
        'INSERT INTO perros (nombre, raza, edad, usuario_id) VALUES ($1, $2, $3, $4) RETURNING *',
        [nombre, raza, edad, usuarioId]
      );
      return res.status(201).json({ mensaje: 'Perfil del perro creado.', perro: nuevo.rows[0] });
    }
  } catch (error) {
    console.error('❌ Error al guardar el perfil del perro:', error);
    res.status(500).json({ mensaje: 'Error al guardar el perfil del perro.' });
  }
};

module.exports = {
  obtenerPerfilPerro,
  guardarPerfilPerro
};
