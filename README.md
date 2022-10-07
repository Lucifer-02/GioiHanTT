# Kiểm chứng định lý Giới hạn trung tâm

> Ý nghĩa của Định lý giới hạn trung tâm là khi có nhiều nhân tố ngẫu nhiên tác động (sao cho không có nhân tố nào vượt trội lấn át các nhân tố khác) thì kết quả của chúng có dạng phân phối tiệm cận chuẩn.

## Ý tưởng
Theo ý nghĩa trên nếu biến:
`y = f(a1) + f(a2) +...`

Với:
- a1,a2,... là các biến ngẫu nhiên
- Các hàm f() tương ứng có giá trị không lấn án các phần còn lại

Thì y có phân phối gần chuẩn

## Thực hiện
1. Khởi tạo các biến và một mảng
2. Trong mỗi vòng lặp sẽ gán giá trị ngẫu nhiên cho các biến
3. Tính giá trị của y trong vòng lặp 
4. Trả về một mảng chứa các giá trị của y và ghi vào mảng

> **_NOTE:_**  Ở đây mình viết chương trình tính toán và tạo mảng bằng ngôn ngữ Zig rồi đóng gói thành Python package rồi plot mảng bằng thư viện Python nhằm thử nghiệm ngôn ngữ mới này, các bạn không cần phải làm cồng kềnh như mình mà có thể viết toàn bộ bằng Python.


