#!/bin/bash

USUARIOS="usuarios.txt"
touch "$USUARIOS"

echo "1. Registrarse"
echo "2. Iniciar sesión"
read -p "Elija una opción: " opcion

if [ "$opcion" == "1" ]; then
  read -p "Nombre de usuario: " usuario
  read -s -p "Contraseña: " contrasena
  echo
  if grep -q "^$usuario:" "$USUARIOS"; then
    echo "El usuario ya existe."
  else
    echo "$usuario:$contrasena" >> "$USUARIOS"
    echo "Usuario registrado."
  fi

elif [ "$opcion" == "2" ]; then
  read -p "Nombre de usuario: " usuario
  read -s -p "Contraseña: " contrasena
  echo
  if grep -q "^$usuario:$contrasena$" "$USUARIOS"; then
    echo "Inicio de sesión exitoso."
  else
    echo "Usuario o contraseña incorrectos."
  fi
else
  echo "Opción inválida."
fi
