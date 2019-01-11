FROM python:3.7
ADD __main__.py /
ADD _version.py /
ADD requirements.txt /
RUN pip install -r requirements.txt
CMD ["python", "./__main__.py"]
