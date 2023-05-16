FROM python:3.11.3-slim-buster

ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=off

# RUN apt-get update
# RUN apt-get install -y python3 python3-venv python-dev build-essential

WORKDIR /app

RUN python3 -m venv .venv
RUN /bin/bash -c "source .venv/bin/activate"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

ENV FLASK_APP=src/app.py
EXPOSE 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=5000"]
