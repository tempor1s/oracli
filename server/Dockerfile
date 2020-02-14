FROM python:3

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r ./server/requirements.txt

COPY . /app

EXPOSE 5000
CMD [ "python", "./run.py" ]