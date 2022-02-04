
FROM python
WORKDIR /
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

ENV CELERY_BROKER_URL redis://redis:6379/0
ENV CELERY_RESULT_BACKEND redis://redis:6379/0
RUN pip install celery
ENV DEBUG true
ENV PORT 5000
RUN pip install gunicorn
CMD gunicorn --bind 0.0.0.0:$PORT main:app
