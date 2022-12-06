FROM openjdk:11-jre
LABEL maintainer "dominik.grzelak@tu-dresden.de"
RUN mkdir -p /root/cdo-v4.20/
COPY ./cdo-v4.20/ /root/cdo-v4.20/
RUN chmod -R +x /root/cdo-v4.20/
RUN export PATH=$PATH:/root/cdo-v4.20/eclipse/
VOLUME /root/cdo-v4.20/eclipse/database/
#VOLUME /root/cdo-v4.20/eclipse/configuration/
EXPOSE 2036
WORKDIR /root/cdo-v4.20/eclipse/
ENTRYPOINT ["./eclipse", "-debug", "-consoleLog"]
