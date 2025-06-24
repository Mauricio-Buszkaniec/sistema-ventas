#!/bin/bash

PRODUCTOS="productos.txt"
touch $PRODUCTOS

echo "ALTA DE PRODUCTOS"
read -p "Nombre del producto: " nombre
read -p "Descripción: " descripcion
read -p "Precio: " precio
read -p "Stock inicial: " stock

if grep -q "^$nombre:" "$PRODUCTOS"; then
  echo "El producto ya existe."
else
  echo "$nombre:$descripcion:$precio:$stock" >> "$PRODUCTOS"
  echo "Producto agregado correctamente."
fi
