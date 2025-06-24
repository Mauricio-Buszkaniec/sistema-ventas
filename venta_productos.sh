#!/bin/bash

PRODUCTOS="productos.txt"
VENTAS="ventas.txt"
touch $PRODUCTOS $VENTAS

echo "VENTA DE PRODUCTOS"

echo
echo "Productos disponibles:"
cat -n $PRODUCTOS
echo

read -p "Ingrese el nombre del producto a comprar: " prod
read -p "Cantidad a comprar: " cantidad
read -p "Ingrese su nombre de usuario (logueado): " usuario

if grep -q "^$prod:" "$PRODUCTOS"; then
  linea=$(grep "^$prod:" "$PRODUCTOS")
  desc=$(echo "$linea" | cut -d':' -f2)
  precio=$(echo "$linea" | cut -d':' -f3)
  stock=$(echo "$linea" | cut -d':' -f4)

  if [ "$cantidad" -le "$stock" ]; then
    nuevo_stock=$((stock - cantidad))
    total=$((precio * cantidad))
   
    sed -i "s/^$prod:$desc:$precio:$stock\$/$prod:$desc:$precio:$nuevo_stock/" "$PRODUCTOS"

    fecha=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$fecha | Usuario: $usuario | Producto: $prod | Cantidad: $cantidad | Total: \$${total}" >> "$VENTAS"

    echo "Compra exitosa. Total: \$${total}"
  else
    echo "Stock insuficiente."
  fi
else
  echo "Producto no encontrado."
fi
