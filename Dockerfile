FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY service/ /app/service/

EXPOSE 8080

ENV FLASK_APP=service:app
ENV PORT=8080

# Switch to a non-root user
RUN useradd -m myuser
USER myuser

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--log-level=info", "service:app"]
