# Etapa de construcción
FROM node:16 as build

WORKDIR /app

RUN apt-get update && apt-get install -y git

# Clonar el repositorio de GitHub
RUN git clone https://github.com/Davlopez06/StarWars.git .

RUN npm install
RUN npm run build

# Etapa de producción
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
