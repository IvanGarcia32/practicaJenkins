#!/bin/bash
set -e

# Ruta local del archivo CSS
CSS_FILE="w3.css"

# Verificar si el archivo CSS ya existe
if [ ! -f "$CSS_FILE" ]; then
    echo "Descargando archivo css"
    curl -O https://www.w3schools.com/w3css/4/w3.css || { echo "Error al descargar w3.css"; exit 1; }
else
    echo "Ya lo has descargado"
fi

# Crear carpeta de salida
OUTPUT_DIR="pagIvan"
mkdir -p "$OUTPUT_DIR"

# Generar los archivos HTML
echo "Generando index.html"
cat <<EOL > index.html
<!DOCTYPE html>
<html>
<head>
    <title>Página de inicio</title>
    <link rel="stylesheet" href="w3.css">
</head>
<body class="w3-container">
    <h1 class="w3-center">Página de Inicio - Iván García</h1>
    <ul class="w3-ul">
        <li><a href="pag1.html">Página 1</a></li>
        <li><a href="pag2.html">Página 2</a></li>
        <li><a href="pag3.html">Página 3</a></li>
    </ul>
</body>
</html>
EOL

echo "Generando pag1.html"
cat <<EOL > pag11.html
<!DOCTYPE html>
<html>
<head>
    <title>Página 1</title>
    <link rel="stylesheet" href="w3.css">
</head>
<body class="w3-container">
    <h1 class="w3-center">Página 1 - Iván García</h1>
    <a href="index.html">Volver al index</a>
</body>
</html>
EOL

echo "Generando pag2.html"
cat <<EOL > pag2.html
<!DOCTYPE html>
<html>
<head>
    <title>Página 2</title>
    <link rel="stylesheet" href="w3.css">
</head>
<body class="w3-container">
    <h1 class="w3-center">Página 2 - Iván García</h1>
    <a href="index.html">Volver al index</a>
</body>
</html>
EOL

echo "Generando pag3.html"
cat <<EOL > pag3.html
<!DOCTYPE html>
<html>
<head>
    <title>Página 3</title>
    <link rel="stylesheet" href="w3.css">
</head>
<body class="w3-container">
    <h1 class="w3-center">Página 3 - Iván García</h1>
    <a href="index.html">Volver al index</a>
</body>
</html>
EOL

# Copiar los archivos HTML al directorio de salida
cp *.html "$OUTPUT_DIR/"
echo "Sitio construido en la carpeta $OUTPUT_DIR."
