FROM python:3.11.3-slim-buster

ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=off

# RUN apt-get update
# RUN apt-get install -y python3 python3-venv python-dev build-essential

WORKDIR /app

python3 -m venv .venv
source .venv/bin/activate

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=5000", "--app=src/app"]
