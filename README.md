comandos para que funcione el docker:

```bash
docker build -t davlopez06/docker-app:lastest https://github.com/Davlopez06/docker-app.git
docker run -d --name docker-app -p 3000:3000 -it davlopez06/docker-app:lastest
```

En localhost:3000 se deberia ver asi:

![Alt text](image.png)