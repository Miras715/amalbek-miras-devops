FROM python:3.12-slim

WORKDIR /app

COPY app/ /app/
COPY Amalbek_Miras_info.txt /app/

RUN python -m py_compile /app/main.py

ENV STUDENT_NAME=Miras \
    STUDENT_SURNAME=Amalbek \
    STUDENT_GROUP=IT2-2313 \
    STUDENT_ID=37270 \
    APP_PORT=8080

EXPOSE 8080

CMD ["python", "-u", "main.py"]
