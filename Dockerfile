FROM python:3.10.6-alpine
WORKDIR /python-pipeline-samples
ADD . /python-pipeline-samples
EXPOSE 5000
RUN pip install -r requirements.txt
CMD ["python3", "./app.py"]