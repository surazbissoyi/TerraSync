FROM python:3.12-slim
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -e .
EXPOSE 8787
# Railway injects $PORT and mounts a volume at /data; defaults keep local `docker run` working too.
CMD ["sh", "-c", "terrashield --db ${TERRASHIELD_DB:-/data/terrashield.db} serve --host 0.0.0.0 --port ${PORT:-8787}"]
