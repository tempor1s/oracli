# [Oracli Backend](https://oracli.dev.benlafferty.me)

Oracli Backend contains all the code that runs the API as well as the basic landing page.

## 🚀 Getting Started

### Installation & Running

All you need is Docker installed and running on your local machine.

Requirements:

-   [Docker](https://www.docker.com/)

Installation:

```bash
# clone the resposity
git clone https://github.com/tempor1s/oracli
# change directory
cd oracli/server
```

Next, we need to configure environment variables.

First, rename `.env.example` to `.env`

Then, modify the SECRET_KEY in the `.env` file to be whatever you want. It should look like below when you are done.

```bash
DATABASE_URL=mongodb://db:27017/oracli
APP_SETTINGS=config.ProductionConfig
SECRET_KEY=changethislocally
```

From here, it is as simple as running one command and everything should be up and running!

```bash
# check to make sure docker is running if you want
docker info
# run everything in a container :)
docker-compose up --build
```

Everything should be now running. To ensure that, you can run a simple ping to `http://localhost:5000`

```bash
# ensure that the server is working!
curl http://localhost:5000
# The above command should have responded with {"hello": "world"} :)
```
