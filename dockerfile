FROM node:alpine

WORKDIR /app

RUN apt-get update && apt-get install -y git

# Clona el repositorio
RUN git clone https://github.com/Davlopez06/StarWars.git

# Cambia al directorio de la aplicación React
WORKDIR /app/StarWars/front

# Copia el archivo package.json y el package-lock.json
COPY package*.json .

RUN npm install --force

COPY . .

RUN npm run build 

EXPOSE 3000

CMD [ "npm", "start" ]