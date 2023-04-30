# AnimeTube Server

## Setup

### Requirements

- MariaDB
- Node.js

### Clone the repository

```bash
git clone https://github.com/dicarlo-meucci/animetube-server.git
cd animetube-server
mv .env.example .env
```


### Configure

- edit the `.env` file

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=animetube
DB_PORT=3306
AUTH_TOKEN_LENGTH=2048
SALT_ROUNDS=10
```

- run the queries present in the `db.dump.sql` file on your MariaDB instance

### Run
```bash
node .
```

at this point, all API endpoints hits will be logged to `stdout`

## Documentation

API documentation is available at `http://<server address>:<port>/docs` through Swagger