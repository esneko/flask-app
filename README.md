```bash
$ python3 -m venv .venv
$ source .venv/bin/activate
(.venv) $ pip install -r requirements.txt
(.venv) $ flask --app src/app run
```

```bash
$ docker build -t flask-app .
$ docker run -it -p 5000:5000 flask-app
```
