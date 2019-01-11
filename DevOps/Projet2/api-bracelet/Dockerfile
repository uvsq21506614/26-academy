FROM python:3
RUN mkdir /usr/src/app
COPY __main__.py /usr/src/app
COPY _version.py /usr/src/app
COPY requirements.txt /usr/src/app
RUN pip install -r requirements.txt
CMD [ "python", "/usr/src/app/__main__.py" ]
