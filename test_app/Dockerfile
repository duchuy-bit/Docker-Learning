# Sử dụng image có sẵn GCC
FROM gcc:latest

# Tạo thư mục để chứa source code
RUN mkdir /usr/src/cpp_app

# Copy source code và thư mục test cases vào container
COPY . /usr/src/cpp_app

# Đặt thư mục làm việc
WORKDIR /usr/src/cpp_app

# Biên dịch chương trình
RUN g++ -o app main.cpp

# Thiết lập script để chạy khi container khởi động
CMD ["bash", "run_tests.sh"]
