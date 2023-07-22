# Lab SSTI
## Giới thiệu:
- Đây là lab chứa lỗ hổng SSTI mà em và người đóng góp chủ yếu là [Âu Quang Đức](https://github.com/Twil4) thực hiện nhằm để luyện tập khai thác lỗ hổng này và là tư liệu để em phát triển các trang web khác không bị dính phải lỗ hổng SSTI này
- Trang web này sử dụng ngôn ngữ PHP, HTML, CSS, JavaScript, Twig template và Dockerfile để chạy trên local 
## Tính năng:
- Đây là một trang web đơn giản chứa hình ảnh mèo và chức năng xem thêm nếu muốn biết thêm thông tin chi tiết về mèo con:
![trang chủ](image.png)
- Khi ấn vào xem thêm thì trang web sẽ hiện ra ảnh full đồng thời một vài mô tả về hình mèo đó:
![mèo like](image-1.png)
- Vì bọn em phân loại ID theo tên trực tiếp trên URL để xổ ra tên mèo ở bên trên cùng, cùng với việc GET thẳng thằng này vào trong template Twig nên trang web đã bị dính lỗ hổng SSTI, đầu tiên ta sẽ test với payload kinh điển `{{7*'7'}}`:
![dấu hiệu ssti](image-2.png)
- Kết quả ra 49, không còn nghi ngờ gì nữa, trang web đã bị dính SSTI. Tiếp đó em sẽ sử dụng payload `{{['ls']|filter('system')}}` nhằm liệt kê ra các file có trong hệ thống:
![exploit](image-3.png)
- Đã có sự xuất hiện của flag.txt, giờ ta thực hiện cat file này sẽ có được flag:
![flag](image-4.png)
- Như vậy. flag của lab là: KMA{3asy_tw1g_php_sst1_la6}
## Tổng kết:
- Đây là một lab dính SSTI ở mức độ cơ bản cho ta biết được độ nguy hiểm khi cho thẳng biến `ID` vào bên trong template mà chưa qua kiểm duyệt. Để phòng tránh SSTI, ta cần phải gán vào template theo dạng tĩnh, đồng thời tiến hành kiểm tra và filter đầu vào của người dùng, ví dụ như sử dụng blacklist để lọc các ký tự không an toàn:
![black list](image-5.png)
- Lưu ý mỗi template sẽ có cách khai thác khác nhau, nên hãy chú ý và blacklist những ký tự đặc biệt tương ứng với template mà ta sử dụng.