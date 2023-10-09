FROM ubuntu
RUN apt update && apt install openjdk-17-jdk -y
CMD [ "sleep","1d" ]