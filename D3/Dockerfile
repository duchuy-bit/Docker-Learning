FROM ubuntu:latest

RUN apt-get -y update && apt-get install -y

RUN apt-get -y install clang

RUN mkdir /usr/src/cpp_test

COPY . /usr/src/cpp_test

WORKDIR /usr/src/cpp_test

RUN clang++ -o Test main.cpp

CMD [ "./Test" ]