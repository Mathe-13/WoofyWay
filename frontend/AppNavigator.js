import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Ionicons } from '@expo/vector-icons';

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
const Tab = createBottomTabNavigator();

function Tabs() {
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        headerShown: false,
        tabBarIcon: ({ focused, color, size }) => {
          let iconName;
          if (route.name === 'Dashboard') iconName = focused ? 'home' : 'home-outline';
          else if (route.name === 'Ejercicios') iconName = focused ? 'fitness' : 'fitness-outline';
          else if (route.name === 'PerfilPerro') iconName = focused ? 'paw' : 'paw-outline';
          else if (route.name === 'Progreso') iconName = focused ? 'bar-chart' : 'bar-chart-outline';
          else if (route.name === 'FinalizarSesion') iconName = focused ? 'log-out' : 'log-out-outline';
          return <Ionicons name={iconName} size={size} color={color} />;
        },
        tabBarActiveTintColor: '#2C3E50',
        tabBarInactiveTintColor: 'gray',
      })}
    >
      <Tab.Screen name="Dashboard" component={DashboardScreen} />
      <Tab.Screen name="Ejercicios" component={EjerciciosScreen} />
      <Tab.Screen name="PerfilPerro" component={PerfilPerroScreen} />
      <Tab.Screen name="Progreso" component={ProgresoScreen} />
      <Tab.Screen name="FinalizarSesion" component={FinalizarSesionScreen} />
    </Tab.Navigator>
  );
}

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator screenOptions={{ headerShown: false }}>
        <Stack.Screen name="Login" component={LoginScreen} />
        <Stack.Screen name="Register" component={RegisterScreen} />
        <Stack.Screen name="Main" component={Tabs} />
        <Stack.Screen name="EjercicioDetalle" component={EjercicioDetalleScreen} />
        <Stack.Screen name="Planes" component={PlanesScreen} />
        <Stack.Screen name="SeleccionarPlan" component={SeleccionarPlanScreen} />
        <Stack.Screen name="AgregarPerro" component={AgregarPerroScreen} />
        <Stack.Screen name="MenuDev" component={MenuDevScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
