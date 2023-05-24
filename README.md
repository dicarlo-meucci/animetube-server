# AnimeTube Server

## Setup

### Requirements

-   MariaDB
-   Node.js

### Clone the repository

```bash
git clone https://github.com/dicarlo-meucci/animetube-server.git
cd animetube-server
npm install
mv .env.example .env
```

### Configure

-   edit the `.env` file

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=animetube
DB_PORT=3306
AUTH_TOKEN_LENGTH=2048
SERVER_PORT=3000
```

-   run the queries present in the `db.dump.sql` file on your MariaDB instance

### Run

```bash
node .
```

At this point, all API endpoints hits will be logged to `stdout`

## Docker

It is also possible to run the server using docker and docker compose.
You will need to run the following command

```
npm run build-docker
```

This command will start the docker compose build process for the server image.
Once it is done you can run the final command

```
npm run deploy-docker
```

This command will deploy the containers using docker compose and everything will be ready in about 30 seconds

## Documentation

API documentation is available at `http://<server address>:<port>/docs` through Swagger
