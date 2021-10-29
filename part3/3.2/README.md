Build the image
```bash
$ docker build . -t docker-in-docker
```

The following command will download docker-hy/ml-kurkkumopo-backend repository and publish it to username/exercise32-backend in DockerHub

```bash
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock docker-in-docker -u <username> -t <password or token> -r docker-hy/ml-kurkkumopo-backend -n exercise32-backend
```

To show all the parameters of the script you can run
```bash
$ docker run -it --rm docker-in-docker --help
```