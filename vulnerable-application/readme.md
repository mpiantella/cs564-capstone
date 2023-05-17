Inside the `vulnerable-application` folder run
```
docker build --network host -t app-poc .
docker run --network host app-poc
```

Build the jar

```
mvn package
```

https://www.digitalocean.com/community/tutorials/install-maven-linux-ubuntu
