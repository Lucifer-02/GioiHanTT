# Kiểm chứng định lý Giới hạn trung tâm

> Ý nghĩa của Định lý giới hạn trung tâm là khi có nhiều nhân tố ngẫu nhiên tác động (sao cho không có nhân tố nào vượt trội lấn át các nhân tố khác) thì kết quả của chúng có dạng phân phối tiệm cận chuẩn.

## Ý tưởng
Theo ý nghĩa trên nếu biến:
$$y = f_1(A_1) + f_2(A_2) +...$$
Với:
- $A_1,A_2,...$ là các biến ngẫu nhiên
- Các hàm $f_i$ tương ứng có giá trị không lấn án các phần còn lại

Thì $y$ có phân phối gần chuẩn

## Thực hiện
1. Khởi tạo các biến và một mảng trong `src/main.zig`
2. Trong mỗi vòng lặp sẽ gán giá trị ngẫu nhiên cho các biến
3. Tính giá trị của y trong vòng lặp 
4. Trả về một mảng chứa các giá trị của y và ghi vào mảng
5. Viết script python gọi hàm trên ra dạng numpy và plot histogram

> **_NOTE:_**  Ở đây mình viết chương trình tính toán và tạo mảng bằng ngôn ngữ Zig rồi đóng gói thành Python package sau đó plot mảng bằng thư viện Python nhằm thử nghiệm ngôn ngữ mới này, các bạn không cần phải làm cồng kềnh như mình mà có thể viết toàn bộ bằng Python.

## Kết quả với 1 triệu mẫu

1. $y = a + 2b$

![image](https://user-images.githubusercontent.com/84069686/194537097-71a4f922-e5c6-4fdb-bb12-31b62184aafe.png)

2. $y = a + 2b - 12c + 155$

![image](https://user-images.githubusercontent.com/84069686/194537222-a6708c96-a4b2-4664-b278-3bc8ddf08d73.png)

3. $y = a + 2b - 6c + 155 + d + 3e - f$

![image](https://user-images.githubusercontent.com/84069686/194537330-ffb392c6-92a6-4318-b03d-80ca7498da53.png)

4. $y = a + 2b - 6c + 155 + d + 3e - f + (g - h)*7$

![image](https://user-images.githubusercontent.com/84069686/194537391-ada857c7-d73f-4b79-972e-174a61ad437c.png)

### Có thể thấy khi tăng số yếu tố ảnh hưởng đến y thì phân phối của nó sẽ dần tiến về chuẩn, thật là vi diệu 😯. Người ta vẫn đang tranh cãi việc Toán học được khám phá hay phát minh ra, có vẻ trong trường hợp này câu trả lời nghiêng về bên trái!
