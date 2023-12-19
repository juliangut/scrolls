# Docker

## Requirements

Add Docker repo

```bash
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/fedora/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
```

Install Docker

```bash
sudo dnf install docker-engine
```

Enable service

```bash
sudo systemctl enable docker.service
sudo systemctl start docker
```

Create docker group

```bash
sudo groupadd docker
```

Add user to docker group

```bash
sudo usermod -aG docker [username]
```

### Docker-compose

Install from binary

```bash
curl -s https://api.github.com/repos/docker/compose/releases/latest \
  | grep browser_download_url \
  | grep docker-compose-linux-x86_64 \
  | cut -d '"' -f 4 \
  | wget -qi -

chmod +x docker-compose-linux-x86_64

sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
```

#### Auto completion

Download script that can be found alongside this document or can be downloaded from:

```bash
sudo curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose -o ~/.docker-compose-completion.sh
```

Put the file in your home directory and add the following lines to ~/.bashrc

```bash
if [ -f ~/.docker-compose-completion ]; then
    source ~/.docker-compose-completion.sh
fi
```

## Images

### Building

```bash
docker build --rm -t [image_repository/name] [path_to_Dockerfile]
```

Image repository/name format is `namespace/image_name:tag_name`

Useful parameters:

* `--rm` remove intermediate containers
* `--no-cache` forces recreation of all layers

## Containers

### Running

```bash
docker run -it [image_name] [command]
```

Useful parameters:

* `--name NAME` set container name
* `-it` runs with interactive pseudo-tty
* `-d` runs container in the background
* `-p [container_port]:[host_port]` opens the exposed port on an host machine
* `--link [container_name]:[alias]` allows a container to access another container
* `-v [host_path]:[container_path]` for external volume linking
* `-e KEY=VAR` set environment variable
* `--restart="always"` restarts your container after a failure or a system reboot

### List

```bash
docker ps -a
```

### Access

```bash
docker exec -it [container_name|container_id] bash
```

### Logs

```bash
docker logs [container_name|container_id]
```

## Cleanup

### Exited containers

```bash
docker rm -v $(docker ps -a -qf status=exited)
```

### Unwanted images

```bash
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

### Unwanted volumes

```bash
docker volume rm $(docker volume ls -qf dangling=true)
```
