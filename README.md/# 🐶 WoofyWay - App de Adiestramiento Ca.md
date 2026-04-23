# 🐶 WoofyWay - App de Adiestramiento Canino

Aplicación móvil desarrollada como Trabajo de Fin de Grado (TFG) en Desarrollo de Aplicaciones Multiplataforma (DAM).

WoofyWay permite a los usuarios gestionar el entrenamiento de sus perros mediante planes personalizados, ejercicios detallados y seguimiento de progreso.

---

## 🚀 Tecnologías utilizadas

### 📱 Frontend

* React Native (Expo)
* JavaScript
* React Navigation

### ⚙️ Backend

* Node.js
* Express

### 🗄️ Base de datos

* PostgreSQL

### 🔐 Autenticación

* JSON Web Tokens (JWT)

---

## 📱 Funcionalidades principales

* Registro de usuarios
* Inicio de sesión con autenticación
* Creación y edición del perfil del perro
* Visualización de ejercicios de adiestramiento
* Detalle paso a paso de cada ejercicio
* Sistema de seguimiento del progreso
* Navegación completa entre pantallas

---

## 📦 Estructura del proyecto

```
WoofyWay/
├── frontend/     → Aplicación móvil (React Native)
├── backend/      → API REST (Node.js + Express)
├── database/     → Script SQL (PostgreSQL)
├── docs/         → Capturas y documentación
└── README.md
```

---

## ⚙️ Instalación y ejecución

### 🔧 Backend

```bash
cd backend
npm install
node server.js
```

### 📱 Frontend

```bash
cd frontend
npm install
npx expo start
```

---

## 🔐 Configuración

Crear un archivo `.env` dentro de la carpeta `backend` con:

```
DB_HOST=localhost
DB_USER=postgres
DB_PASSWORD=tu_password
DB_NAME=woofyway
JWT_SECRET=tu_secreto
```

---

## 🗄️ Base de datos

Importar el archivo SQL ubicado en:

```
/database/woofyway.sql
```

Esto creará las tablas necesarias:

* usuarios
* perros
* plan_entrenamiento
* ejercicio

---

## 📸 Capturas de pantalla y video


* Pantalla de Login
* Registro
* Dashboard
* Perfil del perro
* Ejercicios
* Detalle de ejercicio
* Otros

---

## 📌 Estado del proyecto

✔ Proyecto funcional
✔ Backend probado con Postman
✔ Aplicación ejecutable en entorno local
✔ Preparado para mejoras futuras

---

## 🎯 Objetivo del proyecto

Desarrollar una aplicación móvil completa que permita gestionar el adiestramiento canino de forma personalizada, aplicando conocimientos de desarrollo frontend, backend y bases de datos.

---

## 🚧 Mejoras futuras

* Conexión completa en tiempo real con backend
* Notificaciones push
* Sistema de recomendaciones personalizadas
* Deploy en producción (web o móvil)
* Mejora de diseño UI/UX

---

## 👨‍💻 Autor

Matheus Ferreira
Técnico Superior en Desarrollo de Aplicaciones Multiplataforma (DAM)

---

## 📎 Notas

Este proyecto ha sido desarrollado con fines educativos como parte del TFG, pero está diseñado con una arquitectura escalable y orientada a una posible aplicación real.
