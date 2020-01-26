FROM python:3
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
RUN apt-get update && \
    apt-get -y install git procps postgresql-client
RUN mkdir /code
RUN mkdir /code/static
RUN mkdir /code/media
WORKDIR /code
COPY requirements.txt /code
RUN pip install --upgrade pip && \
    pip install pylint && \
    pip install -r requirements.txt && \
    rm requirements.txt && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV SHELL /bin/bash
