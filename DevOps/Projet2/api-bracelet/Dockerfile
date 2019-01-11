FROM python:3.7
RUN mkdir /var/www
ADD __main__.py /var/www/__main__.py
ADD _version.py /var/www/_version.py
ADD requirements.txt /var/www/requirements.txt
RUN pip install -r requirements.txt
CMD ["python", "/var/www/__main__.py"]
