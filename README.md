Gotty Docker
===
This example can be used to share the terminal using gotty[1] in the docker container with the 'latest' Ubuntu image.  
(Latest tested version : 24.04)  
  
Edit : Forked from hyeonsangjeon/gotty-docker[2] by dremoochy for testing and educational purposes.  
  
To try the example, you need to have Docker installed on your OS. And needed sudoers account permission[3]  


After docker installation, execute this command to bake a docker image in a terminal:
```console
docker build -t dremoochy/gotty:latest .
```

#### Let's run gotty docker
```console
docker run -p 8989:8080 -d --name gotty -it dremoochy/gotty:latest
```

#### You can alternatively use docker-compose
```console
docker-compose up
```

 or,
```console
docker-compose -f ./compose.yaml up
```

#### Check rest index call :
```console
http://localhost:8989
```


## Docker options 
 
|Variables      |Description                                                   |
|---------------|--------------------------------------------------------------|
|'run'          |run                                                           |  
|'-d'           |background run                                                | 
|'-p'           |expose port container core-os port to your os (port fowarding) |
|'--name'       |container nickname                                            |
|'-i'           |enable bash standard input (stdin)                            |
|'-t'           |using bash TTY mode (pseudo-TTY)                              |


### docker-hub
https://hub.docker.com/r/modenaf360/gotty-docker/ (original image)  
https://hub.docker.com/r/dremoochy/gotty

## Reference
[1].https://github.com/yudai/gotty  
[2].https://github.com/hyeonsangjeon/gotty-docker  
[3].https://docs.docker.com/engine/installation  
