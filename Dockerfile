FROM python:3.12-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .
COPY kmeans_model.pkl .
COPY scaler.pkl .
COPY pca_model.pkl .
COPY templates/ templates/
COPY static/ static/

EXPOSE 5000

CMD ["python", "app.py"]
