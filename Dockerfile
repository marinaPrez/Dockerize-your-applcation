FROM alpine:3.9
#MAINTANER marina
RUN apk update
RUN apk add python3
RUN apk add py3-pip
RUN pip3 install --upgrade pip 

RUN adduser -D myuser
USER myuser
WORKDIR /home/myuser
COPY app.py .
COPY requirments.txt .
ENV PATH="/home/myuser/.local/bin:${PATH}"
RUN pip3 install -r requirments.txt
CMD  [ "python3", "./app.py" ]
