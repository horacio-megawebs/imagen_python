FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \
    && apt-get install -y iputils-ping
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
RUN mkdir /datos1
RUN touch f2.txt

#ARG#
#ARG dir2
#RUN mkdir $dir2
#ARG user
#ENV user_docker $user
#ADD add_user.sh /datos1
#RUN /datos1/add_user.sh

ARG DEBIAN_FRONTEND=noninteractive

#EXPOSE#
RUN apt-get install apt-utils
RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos1

#VOLUME#
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

#CMD#
CMD /datos1/entrypoint.sh

#ENTRYPOINT ["/bin/bash"]
