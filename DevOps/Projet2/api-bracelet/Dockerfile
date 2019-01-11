FROM python:3.7
RUN mkdir /var/www
COPY __main__.py /var/www/__main__.py
COPY _version.py /var/www/_version.py
COPY requirements.txt /var/www/requirements.txt
RUN pip install -r requirements.txt
CMD ["python", "/var/www/__main__.py"]
