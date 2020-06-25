FROM ubuntu
MAINTAINER Ritesh Mahajan
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev
RUN pip3 install virtualenv
RUN virtualenv -p python3 irispoc
RUN /bin/bash -c "source /irispoc/bin/activate"
COPY ./requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt
ADD hello.py /home/Desktop/irispoc/hello.py
ADD a.py /home/Desktop/irispoc/a.py
CMD ["/home/Desktop/irispoc/hello.py"]
ENTRYPOINT ["python3"]

