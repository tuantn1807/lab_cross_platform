// Mỗi năm tiền trong tài khoản tăng 10%. Ban đầu có S đồng. Sau n năm có bao nhiêu tiền?
#include <iostream>
float tinhtien(int nam,int s)
{
    if (nam == 1) return s;
    else return tinhtien(nam-1)*1,1;
    
}
//Tính tổng tiền hóa đơn nhiều tầng (thực tế thương mại)
//Một hóa đơn có nhiều cấp: hóa đơn tổng gồm nhiều hóa đơn con, mỗi hóa đơn con lại gồm nhiều hóa đơn nhỏ hơn. Tính tổng tiền.
//c5:Tính số đường đi trong bản đồ ô vuông (robot)
Bài toán thực tế
Robot đi từ góc trên trái đến góc dưới phải, chỉ đi phải hoặc xuống.

 | - | - | - | 
 | - | - | - | 
 | - | - | - | 
 | - | - | - | 
count = 0 (if i = 1 or j = 1)
else count = count(i-1,j)+count(i,j-1)
7. Quản lý cây danh mục sản phẩm (E-commerce)
Bài toán
Danh mục có dạng cây:
Điện tử
 ├── Điện thoại
 │    ├── Android
 │    └── iOS
 └── Laptop
Yêu cầu: in toàn bộ danh mục.

void print(level)
