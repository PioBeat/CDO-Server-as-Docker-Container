![](./cdo-for-docker-logo.png)

# CDO Server as Docker Container (CDOaC)

This repository contains [Eclipse CDO](https://www.eclipse.org/cdo/) and all necessary configuration files to build and run the server in a Docker container.

## Requirements

| Name           | Version     |
| -------------- | ----------- |
| Docker         | >= 20.10.21 |
| Docker Compose | >= 2.12.2   |

### Install Docker and Docker-Compose

```bash
# Install docker: https://docs.docker.com/install/
```

## Build Configuration

First, clone this repository and make sure that you have enough space on your filesystem (~2GB). Then change into the repository folder:

- Use `git clone --single-branch --branch <branchname> <remote-repo>` to checkout a specific branch which reflects a concrete CDO version, e.g., `<branchname> = cdo-4.10`, `<remote-repo> = this Git repository`.

Use the following scripts in this order to setup the CDO server and build the Docker image:

```bash
# It may be necessary to run 'chmod +x' first on these scripts and with sudo
$ configure.sh
$ build.sh
```

The `build.sh` script is essentially doing the following:

```bash
# Build the image
$ docker compose build
```

Then **start the container** by typing:

```bash
$ start.sh
```

which executes `docker compose up`.

If everything runs fine the output should look like this:

```bash
...
Creating cdo-server-oxygen-docker_cdo-server_1 ... done
Attaching to cdo-server-oxygen-docker_cdo-server_1
cdo-server_1  | [INFO] CDO server starting
cdo-server_1  | [INFO] CDO repository repo1 started
cdo-server_1  | [INFO] Repository configuration manager extension starting
cdo-server_1  | [INFO] Repository configuration manager extension started
cdo-server_1  | [INFO] Net4j extension starting
cdo-server_1  | [INFO] Net4j acceptor starting: tcp://0.0.0.0:2036
cdo-server_1  | [INFO] Net4j extension started
cdo-server_1  | [INFO] Security extension starting
cdo-server_1  | [INFO] Security extension started
cdo-server_1  | [INFO] CDO server started
...
```

(To shutdown the server, just enter <kbd>CTRL+C</kbd> and wait until the server is gracefully stops)

- The CDO server is now available under `localhost:2036`. 

- The default name of the CDO repository is `repo1`.

- A *volume* is created for the folders `./etc/database` in order to persist the database changes when the user updates the database (otherwise the database is useless and looses all changes when the container is stopped).

#### Helpful Docker Commands

- Use the standard `docker-compose` commands to build and run the image:

```bash
$ docker compose up --build
```

- `docker images -a`
- `docker run -it --entrypoint /bin/bash IMAGE_ID`
- `docker-compose down --remove-orphans`
- `docker system prune -a`

## Repository Configuration

- How to change the repository name?
  - Make the necessary changes in `cdo-server.xml`
- How to change the port of the CDO server?
  - Make the necessary changes in `cdo-server.xml`, `docker-compose.yaml` and `Dockerfile`
- How to use another database from the host system than the one provided?
  - Make the necessary changes in `cdo-server.xml`, `docker-compose.yaml` and `Dockerfile`

## Further Resources

- https://gitlab2.informatik.uni-wuerzburg.de/descartes/tools.descartes.dml.cdo.server.docker
- https://github.com/robertblust/cdo-server
- https://www.eclipse.org/forums/index.php/t/1066804/
