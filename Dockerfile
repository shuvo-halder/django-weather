FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV STATIC_ROOT=/app/static

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /app/db && mkdir -p /app/static

RUN python manage.py collectstatic --noinput || true

CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8160", "--workers", "3", "--timeout", "60"]