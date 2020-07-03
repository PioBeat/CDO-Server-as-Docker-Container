FROM openjdk:8-jre
LABEL maintainer "dominik.grzelak@tu-dresden.de"
RUN mkdir -p /root/eclipse/ /root/eclipse/cdo-server-oxygen-docker/ /root/eclipse/workspace/
COPY ./cdo-server-oxygen-docker/ /root/eclipse/cdo-server-oxygen-docker/
RUN chmod +x /root/eclipse/cdo-server-oxygen-docker/eclipse
RUN export PATH=$PATH:/root/eclipse/cdo-server-oxygen-docker
VOLUME /root/eclipse/cdo-server-oxygen-docker/database/
EXPOSE 2036
WORKDIR /root/eclipse/cdo-server-oxygen-docker/
ENTRYPOINT ["./eclipse"]
