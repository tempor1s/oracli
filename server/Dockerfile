FROM python:3

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r ./server/requirements.txt

EXPOSE 5000
CMD [ "python", "./server/run.py" ]