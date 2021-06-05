FROM python:3.9-slim

WORKDIR /app

RUN groupadd -r app && useradd -r -s /bin/false -g app app \
      && chown -R app:app /app

USER app

COPY requirements.txt requirements.txt

RUN pip install -t . --no-cache-dir -r requirements.txt

COPY . .

ENTRYPOINT ["alembic"]
