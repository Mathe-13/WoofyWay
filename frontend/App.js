import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import LoginScreen from './screens/LoginScreen';
import RegisterScreen from './screens/RegisterScreen';
import DashboardScreen from './screens/DashboardScreen';
import PerfilPerroScreen from './screens/PerfilPerroScreen';
import ProgresoScreen from './screens/ProgresoScreen';
import EjerciciosScreen from './screens/EjerciciosScreen';
import EjercicioDetalleScreen from './screens/EjercicioDetalleScreen';
import PlanesScreen from './screens/PlanesScreen';
import SeleccionarPlanScreen from './screens/SeleccionarPlanScreen';
import AgregarPerroScreen from './screens/AgregarPerroScreen';
import FinalizarSesionScreen from './screens/FinalizarSesionScreen';
import MenuDevScreen from './screens/MenuDevScreen';


const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Login">
        <Stack.Screen name="Login" component={LoginScreen} />
        <Stack.Screen name="Register" component={RegisterScreen} />
        <Stack.Screen name="Dashboard" component={DashboardScreen} />
        <Stack.Screen name="PerfilPerro" component={PerfilPerroScreen} />
        <Stack.Screen name="Progreso" component={ProgresoScreen} />
        <Stack.Screen name="Ejercicios" component={EjerciciosScreen} />
        <Stack.Screen name="EjercicioDetalle" component={EjercicioDetalleScreen} />
        <Stack.Screen name="Planes" component={PlanesScreen} />
        <Stack.Screen name="SeleccionarPlan" component={SeleccionarPlanScreen} />
        <Stack.Screen name="AgregarPerro" component={AgregarPerroScreen} />
        <Stack.Screen name="FinalizarSesion" component={FinalizarSesionScreen} />
        <Stack.Screen name="MenuDev" component={MenuDevScreen} />

      </Stack.Navigator>
    </NavigationContainer>
  );
}