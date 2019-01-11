FROM python:3
WORKDIR /usr/src/app
RUN git pull
COPY __main__.py /usr/src/app
COPY _version.py /usr/src/app
COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt
CMD [ "python", "/usr/src/app/__main__.py" ]
