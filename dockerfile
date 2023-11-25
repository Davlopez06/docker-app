# Usa la imagen oficial de Node.js 16 como base
FROM node:16

# Establece el directorio de trabajo en /app
WORKDIR /app

# Instala git en el contenedor
RUN apt-get update && apt-get install -y git

# Clona el repositorio desde GitHub
RUN git clone https://github.com/Davlopez06/StarWars.git

# Establece el directorio de trabajo en la carpeta de la aplicación de React
WORKDIR /app/front

# Copia los archivos package.json y package-lock.json al directorio de trabajo
COPY package*.json ./

# Instala las dependencias de la aplicación
RUN npm install --legacy-peer-deps

# Copia el resto de los archivos de la aplicación al directorio de trabajo
COPY . .

# Construye la aplicación (puedes ajustar esto según sea necesario)
RUN npm run build

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 3000

# Comando para ejecutar la aplicación (ajústalo según cómo inicies tu aplicación)
CMD ["npm", "start"]