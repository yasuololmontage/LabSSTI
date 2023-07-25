# Lab SSTI
## Giới thiệu:
- Đây là một trang web đơn giản chứa hình ảnh mèo và chức năng xem thêm nếu muốn biết thêm thông tin chi tiết về mèo con:
![](https://hackmd.io/_uploads/SJ4MYh_92.png)
- Khi ấn vào xem thêm thì trang web sẽ hiện ra ảnh full đồng thời một vài mô tả về hình mèo đó:
![](https://hackmd.io/_uploads/ByINt3uqh.png)
- Vì bọn em phân loại ID theo tên trực tiếp trên URL để xổ ra tên mèo ở bên trên cùng, cùng với việc GET thẳng thằng này vào trong template Twig nên trang web đã bị dính lỗ hổng SSTI, đầu tiên ta sẽ test với payload kinh điển `{{7*'7'}}`:
![](https://hackmd.io/_uploads/B1mrF3u93.png)
- Kết quả ra 49, không còn nghi ngờ gì nữa, trang web đã bị dính SSTI. Sau đó ta sẽ quan sát file Docker, để ý rằng file file flag.txt được copy vào thư mục gốc "/".
```dockerfile!=
COPY flag.txt /
```
- Nên em sẽ sử dụng payload `{{['ls /']|filter('system')}}` nhằm liệt kê ra các file có trong thư mục gốc của hệ thống:
![](https://hackmd.io/_uploads/rytUm2hqh.png)
- Đã có sự xuất hiện của flag.txt, giờ ta thực hiện `car /flag.txt` để đọc nội dung và lấy flag:
![](https://hackmd.io/_uploads/S1zsQnh52.png)
- Như vậy, flag của lab là: **KMA{3asy_tw1g_php_sst1_la6}**
#### Tổng kết:
## Tổng kết:
- Đây là một lab dính SSTI ở mức độ cơ bản cho ta biết được độ nguy hiểm khi cho thẳng biến `ID` vào bên trong template mà chưa qua kiểm duyệt. Để phòng tránh SSTI, ta cần phải gán vào template theo dạng tĩnh, đồng thời tiến hành kiểm tra và filter đầu vào của người dùng, ví dụ như sử dụng blacklist để lọc các ký tự không an toàn:
![black list](/README%20image/image-5.png)
- Lưu ý mỗi template sẽ có cách khai thác khác nhau, nên hãy chú ý và blacklist những ký tự đặc biệt tương ứng với template mà ta sử dụng.
