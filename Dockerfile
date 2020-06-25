FROM ubuntu
MAINTAINER Ritesh Mahajan
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev
RUN pip3 install virtualenv
WORKDIR /irispoc
COPY . /irispoc
RUN virtualenv -p python3 irispoc
RUN /bin/bash -c "source irispoc/bin/activate"
RUN pip3 install -r requirements.txt
ADD hello.py  /
ADD a.py /
CMD ["/irispoc/hello.py"]
ENTRYPOINT ["python3"]

