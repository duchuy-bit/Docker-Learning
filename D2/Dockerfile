FROM gcc:latest

RUN mkdir /usr/src/cpp_test

COPY main.cpp /usr/src/cpp_test

WORKDIR /usr/src/cpp_test

RUN g++ -o Test main.cpp

CMD [ "./Test" ]