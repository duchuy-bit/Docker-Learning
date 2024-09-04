#!/bin/bash

# Biến để đếm số test case thành công
success_count=0
total_count=0

# Thư mục chứa testcase và file mã nguồn của người dùng
testcase_dir="/usr/src/testcases"
user_code_dir="/usr/src/input"

# Tạo thư mục tạm thời để lưu kết quả đầu ra
mkdir -p /usr/src/output

# Lặp qua các file mã nguồn của người dùng
for user_code in /usr/src/input/*.cpp; do
    # Tạo tên file nhị phân từ tên file mã nguồn
    exe_name=$(basename "$user_code" .cpp)

    echo -e "\nTesting file: $(basename $user_code)"
    echo -e "/usr/src/output/$exe_name"

    # Biên dịch mã nguồn của người dùng
    g++ -o "/usr/src/output/$exe_name" "$user_code"

    # Lặp qua các file input trong thư mục testcases
    for input in "$testcase_dir"/input*.txt; do
        echo -e "\nTesting file: $(basename $input)"
        # Tăng số lượng test case
        total_count=$((total_count + 1))
        
        # Tạo đường dẫn file output tương ứng
        output=${input/input/output}
        
        # Chạy chương trình với input và lưu kết quả vào temp_output.txt
        "/usr/src/output/$exe_name" < "$input" > /usr/src/output/temp_output.txt

        # So sánh kết quả với output mong muốn
        if diff -q /usr/src/output/temp_output.txt "$output" > /dev/null; then
            echo "Test $(basename $input) passed for $exe_name"
            success_count=$((success_count + 1))
        else
            echo "Test $(basename $input) failed for $exe_name"
            echo "Expected:"
            cat "$output"
            echo -e "\nGot:"
            cat /usr/src/output/temp_output.txt
        fi
    done

    # Xóa file nhị phân sau khi kiểm tra
    rm "/usr/src/output/$exe_name"
done

# Xóa file tạm
rm /usr/src/output/temp_output.txt

# In ra tổng kết
echo "Passed $success_count out of $total_count tests."
