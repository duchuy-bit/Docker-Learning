# Sử dụng hình ảnh cơ sở với GCC
FROM gcc:latest

# Tạo thư mục làm việc
WORKDIR /usr/src/app

# Sao chép các file testcase và script vào container
COPY testcases /usr/src/testcases
COPY judge.sh /usr/src/app
COPY input /usr/src/input

# Cài đặt các công cụ cần thiết
RUN apt-get update && apt-get install -y \
    make \
    diffutils \
    && rm -rf /var/lib/apt/lists/*

# Quyền thực thi cho script chấm điểm
RUN chmod +x /usr/src/app/judge.sh

# Thiết lập lệnh mặc định để chạy script chấm điểm
CMD ["./judge.sh"]
