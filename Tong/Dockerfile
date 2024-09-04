# Sử dụng image có sẵn GCC
FROM gcc:latest

# Tạo thư mục để chứa source code
RUN mkdir /usr/src/cpp_app

# Copy file main.cpp vào thư mục vừa tạo
COPY main.cpp /usr/src/cpp_app

# Đặt thư mục làm thư mục làm việc chính
WORKDIR /usr/src/cpp_app

# Biên dịch chương trình
RUN g++ -o app main.cpp

# Thiết lập command mặc định khi container chạy
CMD ["./app"]
