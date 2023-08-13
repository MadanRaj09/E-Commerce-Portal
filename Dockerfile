FROM python:slim-buster
WORKDIR /app
COPY requirement.txt .
RUN pip install --upgrade pip && pip3 install -r requirement.txt
COPY . .
RUN python3 manage.py makemigrations && python3 manage.py migrate
EXPOSE 8080
CMD ["python3","manage.py","runserver","0.0.0.0:8080"]