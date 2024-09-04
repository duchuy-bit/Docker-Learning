#!/bin/bash

# Biến để đếm số test case thành công
success_count=0
total_count=0

# Lặp qua các file input trong thư mục testcases
for input in testcases/input*.txt; do
    # Tăng số lượng test case
    total_count=$((total_count + 1))
    
    # Tạo đường dẫn file output tương ứng
    output=${input/input/output}
    
    # Chạy chương trình với input và lưu kết quả vào temp_output.txt
    ./app < "$input" > temp_output.txt

    # loại bỏ các ký tự không mong muốn như khoảng trắng thừa
    # tr -d '[:space:]' < temp_output.txt > temp_output_clean.txt
    # tr -d '[:space:]' < "$output" > output_clean.txt

    # tr -d '\n' < temp_output.txt > temp_output_clean.txt
    # tr -d '\n' < "$output" > output_clean.txt

    # In ra kết quả để kiểm tra
    echo -e "\nTesting file: $(basename $input)"
    echo -e "Expected output:"
    cat "$output"
    od -c "$output"
    echo -e "\nGot output:"
    cat temp_output.txt
    od -c temp_output.txt
    

    # So sánh kết quả với output mong muốn
    if diff -q temp_output.txt "$output" > /dev/null; then
        echo "Test $(basename $input) passed"
        success_count=$((success_count + 1))
    else
        echo "Test $(basename $input) failed"
        echo "Expected:"
        cat "$output"
        echo -e "\nGot:"
        cat temp_output.txt
    fi
done

# Xóa file tạm
rm temp_output.txt

# In ra tổng kết
echo "Passed $success_count out of $total_count tests."
