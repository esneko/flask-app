```bash
$ python3 -m venv .venv
$ source .venv/bin/activate
(.venv) $ pip install -r requirements.txt
(.venv) $ flask --app src/app run
```

```bash
$ docker build -t flask-app .
$ docker images
$ docker run -it -p 5000:5000 flask-app
```

```bash
$ docker ps
$ docker tag a00d4b32bc6c esneko/flask-app:latest
$ docker push esneko/flask-app:latest
```
