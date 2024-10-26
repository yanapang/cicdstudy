FROM python:3.9-slim
WORKDIR /opt/app
COPY . /opt/app
RUN pip install -r requirements.txt
CMD ["python", "app.py"]