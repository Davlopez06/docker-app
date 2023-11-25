# Use la imagen base de Node.js 16
FROM node:16

# Establece el directorio de trabajo en la carpeta de la aplicación
WORKDIR /app

# Instala git (si es necesario)
RUN apt-get update && apt-get install -y git

# Clona el repositorio
RUN git clone https://github.com/Davlopez06/StarWars.git

# Cambia al directorio de la aplicación React
WORKDIR /app/StarWars/front

# Copia el archivo package.json y el package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install --legacy-peer-deps

# Copia el resto de los archivos de la aplicación al directorio de trabajo
COPY . .

# Especifica el comando predeterminado para iniciar la aplicación
CMD ["npm", "start"]
