    FROM python:3.12-alpine3.18

    ENV PYTHONDONTWRITEBYTECODE=1
    ENV PYTHONUNBUFFERED=1

    WORKDIR /app

    RUN apk add --no-cache \
        gcc \
        musl-dev \
        mariadb-connector-c-dev \
        pkgconfig

    COPY requirements.txt .

    RUN pip install --upgrade pip setuptools wheel && \
        pip install --no-cache-dir -r requirements.txt

    COPY . .

    EXPOSE 8000

    CMD ["gunicorn", "notesapp.wsgi:application", "--bind", "0.0.0.0:8000"]