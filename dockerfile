# Usa la imagen oficial de Node.js 16 como base
FROM node:16

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos package.json y package-lock.json al directorio de trabajo
COPY front/package*.json ./

# Instala las dependencias de la aplicación
RUN npm install --legacy-peer-deps

# Copia el resto de los archivos de la aplicación al directorio de trabajo
COPY front/ .

# Construye la aplicación (puedes ajustar esto según sea necesario)
RUN npm run build

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 3000

# Comando para ejecutar la aplicación (ajústalo según cómo inicies tu aplicación)
CMD ["npm", "start"]