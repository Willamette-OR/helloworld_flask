FROM python:slim


RUN useradd helloworld


WORKDIR /home/helloworld


COPY requirements.txt requirements.txt
RUN python3 -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn


COPY app.py boot.sh ./
RUN chmod +x boot.sh


ENV FLASK_APP app.py


RUN chown -R helloworld:helloworld ./
USER helloworld


EXPOSE 5000
ENTRYPOINT [ "./boot.sh" ]
