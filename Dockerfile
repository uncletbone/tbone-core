FROM openjdk:alpine


RUN apk add git \
&& mkdir /home/minecraft \
&& cd /home/minecraft \
&& wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar \
&& java -jar BuildTools.jar --rev latest \
11&& echo "eula=true" > eula.txt 

EXPOSE 25565

ENTRYPOINT cd /home/minecraft && java -Xms512M -Xmx1008M -jar spigot-1.16.3.jar nogui
