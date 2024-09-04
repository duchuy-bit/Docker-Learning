FROM gcc:latest

RUN mkdir /usr/src/cpp_app

COPY main.cpp /usr/src/cpp_app

WORKDIR /usr/src/cpp_app

RUN g++ -o app main.cpp

CMD ["./app"]
