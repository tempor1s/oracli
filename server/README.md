# Oracli Backend

Oracli Backend contains all the code that runs the API as well as the basic landing page.

## 🚀 Getting Started

### Installation and Requirements

Currently, we only require that you have Python3 or Pipenv installed, but in the future the application will be dockerized for easy deployment and development work.

Requirements:

-   [Python 3](https://www.python.org/)
-   [Pipenv](https://pipenv.kennethreitz.org/en/latest/)
-   [MongoDB](https://www.mongodb.com/)

Installation:

```bash
# clone the resposity
git clone https://github.com/tempor1s/oracli
# change directory
cd oracli/server
# create a virtual enviornment and install packages
pipenv shell
pipenv install
```

Congrats! You should now have the Oracli backend installed.

### Getting Everyhing Setup

If you have not yet followed the installation steps, go and do so before continuing.

Now we need to make sure that you have MongoDB installed and running because it is required for the database and therefor the backend. (Docker will save us from this.)

Check to see if you have MongoDB running:

```bash
# run the command
mongod --version
```

If this returns output, you are good to go. If it says something along the lines of `Command not found` then you are going to need to install mongodb.

Installing MongoDB on mac:

```bash
# install MongoDB using homebrew
brew install mongodb-community
# make sure that the service starts
brew services start mongodb-community
# check to make sure it installed correctly
mongod --version
```

The last step is to rename `.env.example` to `.env`, and if everything went correctly then you are good to go!

## Running

```bash
# make sure you are in the correct repository and in a virtual environment, then run the following command
python3 run.py
# ensure that the server is working!
curl http://0.0.0.0:5000
# The above command should have responded with {"hello": "world"} :)
```
