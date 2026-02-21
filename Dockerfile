FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app/backend

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        default-libmysqlclient-dev \
        pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/backend/
RUN pip install --no-cache-dir mysqlclient && \
    pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/backend

EXPOSE 8000

# If needed: uncomment for migrations during build (not recommended)
# RUN python manage.py migrate
# RUN python manage.py makemigrations