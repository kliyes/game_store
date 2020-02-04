FROM python:3.7-alpine

COPY requirements.txt /opt
RUN pip install -i https://pypi.doubanio.com/simple -r /opt/requirements.txt