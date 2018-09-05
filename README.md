# angular-docker-boilerplate

This boilerplate is based on the Vue webpack template, combine with docker to make vuejs easier to run for development stage and provide simple way to deploy on server

## Development stage

### To change local port

Change port flag in dev.docker-compose.yml.

### Building project

```bash
docker-compose -f dev.docker-compose.yml build
```

### Run development stage

```bash
docker-compose -f dev.docker-compose.yml up 
```

### Down all container and remove volumes

```bash
docker-compose down -v
```

## Deployment stage

### Install app independency

```bash
cd app
(sudo) yarn install
```

### Build angular project

```bash
yarn run build
```

### Run deployment version

```bash
(sudo) docker-compose -f prod.docker-compose.yml up -d --build
```

### Down all production version container

```bash
docker-compose down
```