FROM   ubuntu:14.04

# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

# Install current software versions
RUN apt-get --yes update
RUN apt-get --yes upgrade;
RUN apt-get --yes install software-properties-common;
RUN apt-add-repository --yes ppa:webupd8team/java && apt-get --yes update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    apt-get --yes install curl oracle-java8-installer
RUN apt-get --yes install wget
RUN apt-get --yes install unzip
RUN apt-get --yes clean


ADD . /minecraftserver
RUN wget -O /minecraftserver/legends_server.zip http://servers.technicpack.net/Technic/servers/tekkit-legends/Tekkit_Legends_Server_v1.0.10.zip 
RUN cd /minecraftserver && unzip legends_server.zip
RUN rm -rf legends_server.zip

#Expose default port
EXPOSE 25565
ENV JVM_OPTS -Xmx2G -Xms1G 
Volume /minecraftserver/world
WORKDIR /minecraftserver

CMD java $JVMP_OPTS -jar "TekkitLegends.jar" nogui 
