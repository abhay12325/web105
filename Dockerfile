FROM ilp10865002.docker.nat.bt.com/ngae/java:8
VOLUME /tmp
VOLUME /log
VOLUME /docker-resources
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY ngae-git-util-0.0.1-SNAPSHOT.jar ngae-git-util.jar
ENTRYPOINT ["java","-Dspring.config.location=file:docker-resources/GitUtility.properties","-Dspring.profiles.active=gitUtility-application","-Dlogging.config=/docker-resources/log4j2-ngae-git-util.xml","-jar","ngae-git-util.jar"]
