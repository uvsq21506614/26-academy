FROM python:3.7
COPY __main__.py /
COPY _version.py /
COPY requirements.txt /
RUN pip install -r requirements.txt
CMD ["python", "./__main__.py"]
