FROM ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-server && apt-get install -y python3
RUN mkdir /var/run/sshd && mkdir /var/dataa
RUN echo 'root:root123' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN useradd -m nonroot && echo "nonroot:nonroot" | chpasswd && adduser nonroot sudo

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]