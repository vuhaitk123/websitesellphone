-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2026 at 03:37 PM
-- Server version: 8.0.43
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `username` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `name`, `price`, `qty`, `img`, `brand`, `username`) VALUES
(9, 'ip2', 'iPhone 16', 17690000, 1, 'iphone2.jpg', 'iphone', ''),
(10, 'ip1', 'iPhone 15', 14990000, 1, 'iphone1.jpg', 'iphone', ''),
(11, 'rm1', 'Realme Neo8', 9390000, 2, 'r1.jpg', 'realme', ''),
(12, 'rm2', 'Realme GT8 Pro', 14990000, 1, 'r2.jpg', 'realme', ''),
(23, '24', 'REALME C56S', 11200000, 1, 'https://dienthoaihay.vn/images/products/2025/08/16/resized/c65s-xanh_1755308381.jpg', 'realme', '0388292302');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `total` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `username`, `total`, `name`, `phone`, `address`) VALUES
(1, '0388292302', 22480000, 'Vũ Văn Hải', '0388292302', 'Hải Dương'),
(2, '0388292302', 10990000, 'Vũ Văn Hải', '0388292302', 'Hà Nội'),
(3, '0388292302', 5890000, 'Vũ Văn Hải', '0388292302', 'Gia Lộc'),
(4, '0388292302', 13200000, 'Vũ Văn Chung', '0388292302', 'Hải Dương');

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `order_id`, `product_id`, `name`, `price`, `qty`, `img`, `brand`) VALUES
(1, 2, 'rm3', 'Realme GT8', 10990000, 1, 'r3.jpg', 'realme'),
(2, 3, '28', 'REALME NEO7 SE', 5890000, 1, 'https://dienthoaihay.vn/images/products/2025/02/25/resized/realme-neo7-se---xanh_1740497975.jpg', 'realme'),
(3, 4, '11', 'IPHONE 14 PRO', 13200000, 1, 'https://dienthoaihay.vn/images/products/2022/09/12/resized/tim_1662970546.jpg', 'iphone');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `old_price` float DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `image` text,
  `category` varchar(100) DEFAULT NULL,
  `description` text,
  `rating` float DEFAULT '0',
  `review_count` int DEFAULT '0',
  `sku` varchar(50) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `old_price`, `stock`, `image`, `category`, `description`, `rating`, `review_count`, `sku`, `origin`, `brand`, `is_hot`) VALUES
(3, 'IPHONE 16 PRO', 23000000, 25200000, 6, 'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:format(webp):quality(75)/iphone_16_pro_white_titan_4f21b4f56e.png', 'iphone', 'iPhone 16 Pro chính hãng VN/A siêu lướt, nguồn gốc xuất xứ từ VIETTEL , đã kích hoạt, thời gian bảo hành rất dài trên hệ thống của Apple. Máy có đầy đủ hộp, phụ kiện gồm dây sạc, sách HDSD, que chọc sim. Hình thức đẹp, có thể có xước răm nhẹ do vận chuyển, kiểm tra tuy nhiên không ảnh hưởng tới tổng thể. Giá rẻ như máy cũ, số lượng có hạn.', 5, 1, NULL, NULL, NULL, 0),
(4, 'IPHONE 17 PRO MAX', 40000000, 45000000, 15, 'https://dienthoaihay.vn/images/products/2025/09/30/resized/iphone-17-pro-finish-select-2025-4_1759207422.jpg', 'iphone', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 5, 0, NULL, NULL, NULL, 0),
(5, 'IPHONE 17 PRO', 34990000, 36990000, 8, 'https://dienthoaihay.vn/images/products/2025/09/30/resized/iphone-17-pro-finish-select-2025_1759207281.jpg', 'iphone', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 5, 0, NULL, NULL, NULL, 0),
(6, 'IPHONE 16 PRO MAX', 30990000, 32990000, 20, 'https://dienthoaihay.vn/images/products/2025/06/15/resized/16pm-va%CC%80ng_1749979924.jpg', 'iphone', 'iPhone 16 Pro Max chính hãng VN/A siêu lướt pin 100% sạc siêu ít lần, nguồn gốc xuất xứ từ VIETTEL , đã kích hoạt, thời gian bảo hành rất dài trên hệ thống của Apple. Máy có đầy đủ hộp, phụ kiện gồm dây sạc, sách HDSD, que chọc sim. Hình thức đẹp, có thể có xước răm nhẹ do vận chuyển, kiểm tra tuy nhiên không ảnh hưởng tới tổng thể. Giá rẻ như máy cũ, số lượng có hạn. ', 5, 0, NULL, NULL, NULL, 0),
(7, 'IPHONE 17', 20900000, 22990000, 13, 'https://dienthoaihay.vn/images/products/2025/09/30/resized/iphone-17-storage-select-202509-1_1759206838.jpg', 'iphone', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 4, 0, NULL, NULL, NULL, 0),
(8, 'IPHONE 15 PRO', 21000000, 25200000, 6, 'https://dienthoaihay.vn/images/products/2025/07/28/resized/iphone-15-pro-max-blue-thumbnew-600x600_1753640743.jpg', 'iphone', 'iPhone 15 Prro 1TB chính hãng VN/A mới Fullbox,  tình trạng chưa kích hoạt chưa qua sử dụng, phụ kiện chuẩn gồm hộp, thân máy, dây sạc USB-C to Lightning, sách HDSD và que chọc sim. Sản phẩm được bảo hành chính hãng tại các trung tâm bảo hành Apple trên toàn quốc', 5, 0, NULL, NULL, NULL, 0),
(9, 'IPHONE AIR', 16000000, 17500000, 3, 'https://dienthoaihay.vn/images/products/2026/03/12/resized/iphone-air-xanh-1tb_1773324330.jpg', 'iphone', 'iPhone Air bộ nhớ 1TB hàng siêu lướt, chính hãng Việt Nam còn bảo hành rất dài trên hệ thống Apple. Bộ phụ kiện chuẩn bao gồm thân máy, dây sạc, que chọc sim và sách hướng dẫn sử dụng. Sản phẩm có ngoại hình đẹp như mới không trầy xước cấn móp, pin 100% sạc ít lần. Số lượng có hạn.', 5, 0, NULL, NULL, NULL, 0),
(10, 'IPHONE 11', 9300000, 11350000, 32, 'https://dienthoaihay.vn/images/products/2022/03/22/resized/trang_1607225962jpg_1647935195.jpg', 'iphone', 'iPhone 11 chính hãng VNA đã kích hoạt/ chưa kích hoạt là hàng đổi/trả bảo hành hãng Apple, thời gian bảo hành còn rất dài trên hệ thống. Máy mới fullbox, đủ phụ kiện kèm theo (hộp loại bảo vệ môi trường chỉ kèm theo dây sạc), được bảo hành hợp lệ tại các TTBH Apple trên toàn quốc. Giá rẻ như hàng cũ, số lượng có hạn', 5, 0, NULL, NULL, NULL, 0),
(11, 'IPHONE 14 PRO', 13200000, 14350000, 12, 'https://dienthoaihay.vn/images/products/2022/09/12/resized/tim_1662970546.jpg', 'iphone', 'iPhone 14 Pro chính hãng VN/A mới Fullbox tình trạng đã kích/ chưa kích hoạt mới siêu lướt/ chưa qua sử dụng, phụ kiện chuẩn gồm hộp, thân máy, dây sạc USB-C to Lightning, sách HDSD và que chọc sim. Sản phẩm được bảo hành chính hãng tại các trung tâm bảo hành Apple trên toàn quốc.', 4, 0, NULL, NULL, NULL, 0),
(12, 'IPHONE 13', 95500000, 11999000, 6, 'https://dienthoaihay.vn/images/products/2021/09/29/resized/13_1632878128.jpg', 'iphone', 'iPhone 14 chính hãng VN/A mới Fullbox tình trạng đã kích/ chưa kích hoạt mới siêu lướt/ chưa qua sử dụng, phụ kiện chuẩn gồm hộp, thân máy, dây sạc USB-C to Lightning, sách HDSD và que chọc sim. Sản phẩm được bảo hành chính hãng tại các trung tâm bảo hành Apple trên toàn quốc.', 5, 0, NULL, NULL, NULL, 0),
(13, 'XIAOMI 17 ULTRAL', 25690000, 26690000, 12, 'https://dienthoaihay.vn/images/products/2025/12/30/resized/xiaomi-17-ultra-xanh-la%CC%81_1767057865.jpg', 'xiaomi', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 5, 0, NULL, NULL, NULL, 0),
(14, 'XIAOMI REDMI K90', 9900000, 12900000, 6, 'https://dienthoaihay.vn/images/products/2025/10/28/resized/redmi-k90-xanh_1761623707.jpg', 'xiaomi', 'Xiaomi Redmi K90 là chiếc điện thoại thông minh cân bằng tốt mọi yếu tố, từ hiệu năng, tản nhiệt, viên pin, màn hình tới camera trong mức giá dễ chịu, đặc biệt ấn tượng đối với người dùng. Khám phá chi tiết thiết bị di động hấp dẫn này ngay sau đây cùng Dienthoaihay nhé!', 5, 0, NULL, NULL, NULL, 0),
(15, 'XIAOMI REDMI NOTE 14', 3140000, 3900000, 2, 'https://dienthoaihay.vn/images/products/2026/03/27/resized/note-14_1774578282.jpg', 'xiaomi', 'Redmi Note 14 chính hãng DGW bản 4G, có NFC phân phối tại Việt Nam, tình trạng đã kích hoạt, còn bảo hành chính hãng trên hệ thống. Máy Fullbox, đầy đủ phụ kiện gồm sạc cáp, ốp lưng, sách HDSD, que chọc sim, hình thức tổng thể đẹp, có thể có trầy xước nhẹ do vận chuyển. Sản phẩm được bảo hành toàn diện 6 tháng cả nguồn, màn hình, vân tay', 3, 0, NULL, NULL, NULL, 0),
(16, 'XIAOMI 17 PRO', 18900000, 20900000, 32, 'https://dienthoaihay.vn/images/products/2025/09/25/resized/gsmarena_010-5_1758819272.jpg', 'xiaomi', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 4, 0, NULL, NULL, NULL, 0),
(17, 'XIAOMI REDMI NOTE 15', 3450000, 3800000, 16, 'https://dienthoaihay.vn/images/products/2025/08/22/resized/redmi-note-15-tra%CC%86%CC%81ng_1755827850.jpg', 'xiaomi', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 4, 0, NULL, NULL, NULL, 0),
(18, 'XIAOMI REDMI K70 ', 8550000, 9250000, 12, 'https://dienthoaihay.vn/images/products/2024/07/19/resized/o1cn01o78rtp24luxbcsd96_6000000007432-0-remus_1721406572.jpg', 'xiaomi', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 4, 0, NULL, NULL, NULL, 0),
(19, 'XIAOMI 17 5G', 16790000, 17950000, 6, 'https://dienthoaihay.vn/images/products/2025/09/26/resized/xiaomi-17-ho%CC%82%CC%80ng_1758819787.jpg', 'xiaomi', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 5, 0, NULL, NULL, NULL, 0),
(20, 'REDMI NOTE 11 PRO', 4390000, 5000000, 12, 'https://dienthoaihay.vn/images/products/2023/06/02/resized/redmi-note-11-pro-xanh_1685675408.png', 'xiaomi', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, ốp lưng, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay.', 4, 0, NULL, NULL, NULL, 0),
(21, 'XIAOMI REDMI NOTE 11E PRO', 4190000, 4790000, 6, 'https://dienthoaihay.vn/images/products/2023/02/09/resized/xiaomi-redmi-note-11e-pro-1_1675936392.jpeg', 'xiaomi', 'Honor 400 5G máy chính hãng Việt Nam, tình trạng siêu lướt FULLBOX. Hình thức đẹp, có thể có trầy xước trong quá trình vận chuyển. Còn bảo hành dài tối thiểu 12 tháng tại các trung tâm bảo hành chính hãng Honor trên toàn quốc. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, ốp lưng, que chọc sim và sách hướng dẫn sử dụng.', 5, 0, NULL, NULL, NULL, 0),
(22, 'XIAOMI CIVI 2', 5200000, 5200000, 1, 'https://dienthoaihay.vn/images/products/2022/09/28/resized/xiaomicivi2_1664340876.jpg', 'xiaomi', 'Xiaomi Civi 2 - Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, ốp lưng, jack chuyển tai nghe, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay.', 5, 0, NULL, NULL, NULL, 0),
(23, 'REALME G18', 10900000, 12500000, 2, 'https://dienthoaihay.vn/images/products/2025/10/21/resized/realme-gt8-xanh-ngo%CC%A3c_1761059354.jpg', 'realme', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 4, 0, NULL, NULL, NULL, 0),
(24, 'REALME C56S', 11200000, 11900000, 7, 'https://dienthoaihay.vn/images/products/2025/08/16/resized/c65s-xanh_1755308381.jpg', 'realme', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 3, 0, NULL, NULL, NULL, 0),
(25, 'REALME GT6 5G', 9200000, 11300000, 2, 'https://dienthoaihay.vn/images/products/2024/07/09/resized/1720487887138c89a5700bb9c44938ad_1720511046.png', 'realme', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 4, 0, NULL, NULL, NULL, 0),
(26, 'REALME 11 5G', 3200000, 4300000, 9, 'https://dienthoaihay.vn/images/products/2023/05/23/resized/realme-11_1684805903.jpg', 'realme', 'Máy mới 100% chưa qua sử dụng, máy bóc seal sẵn để unlock SIM, cài ROM quốc tế, đầy đủ tiếng Việt, CHplay. Bộ sản phẩm chuẩn của máy bao gồm vỏ hộp ngoài, thân máy, củ sạc, dây sạc, que chọc sim, sách HDSD và ốp lưng tặng kèm. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay.', 3, 0, NULL, NULL, NULL, 0),
(27, 'REALME 11 PRO 5G', 4750000, 5230000, 1, 'https://dienthoaihay.vn/images/products/2022/12/01/resized/realme-10-pro-plus-vang_1669875713.jpg', 'realme', 'Máy mới 100% nguyên seal hộp, chưa qua sử dụng. Bộ sản phẩm chuẩn của máy bao gồm vỏ hộp ngoài, thân máy, củ sạc, dây sạc, que chọc sim, sách HDSD và ốp lưng tặng kèm. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay.', 5, 0, NULL, NULL, NULL, 0),
(28, 'REALME NEO7 SE', 5890000, 6230000, 10, 'https://dienthoaihay.vn/images/products/2025/02/25/resized/realme-neo7-se---xanh_1740497975.jpg', 'realme', 'Máy mới 100% chưa qua sử dụng, chưa kích hoạt, máy được bóc seal sẵn để unlock sim dùng ổn định. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 5, 0, NULL, NULL, NULL, 0),
(29, 'REALME 10 5G', 3800000, 4100000, 6, 'https://dienthoaihay.vn/images/products/2023/04/22/resized/10-5g-den_1682145854.jpg', 'realme', 'Máy mới 100% nguyên seal hộp, chưa qua sử dụng. Bộ sản phẩm chuẩn của máy bao gồm vỏ hộp ngoài, thân máy, củ sạc, dây sạc, que chọc sim, sách HDSD và ốp lưng tặng kèm. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay.', 5, 0, NULL, NULL, NULL, 0),
(30, 'RELAME Q5', 3590000, 4000000, 12, 'https://dienthoaihay.vn/images/products/2022/04/21/resized/den_1650505689.jpg', 'realme', 'realme Q5 - Máy mới 100% nguyên seal hộp, chưa qua sử dụng. Bộ sản phẩm chuẩn của máy bao gồm vỏ hộp ngoài, thân máy, củ sạc, dây sạc, que chọc sim, sách HDSD và ốp lưng tặng kèm. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay.', 5, 0, NULL, NULL, NULL, 0),
(31, 'RELAME C65 5G', 2300000, 3100000, 3, 'https://dienthoaihay.vn/images/products/2024/04/28/resized/pc-green_1714296874.jpg', 'realme', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 4, 0, NULL, NULL, NULL, 0),
(32, 'REALME Q3 PRO', 5600000, 6530000, 8, 'https://dienthoaihay.vn/images/products/2021/04/24/resized/vang_1619234429.jpg', 'realme', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay.', 4, 0, NULL, NULL, NULL, 0),
(33, 'SAMSUNG GALAXY S25 ULTRAL ', 24900000, 26500000, 18, 'https://dienthoaihay.vn/images/products/2025/02/18/resized/galaxy-s25-ultra---ba%CC%A3c-titan_1739887185.jpg', 'samsung', 'Samsung Galaxy S25 Ultra 5G chính hãng Samsung Việt Nam, tình trạng đã kích hoạt, FULLBOX đã mở seal, có thể xước xát nhẹ trong quá trình vận chuyển lưu kho. Sản phẩm còn bảo hành dài chính hãng tại các trung tâm bảo hành Samsung trên toàn quốc', 5, 0, NULL, NULL, NULL, 0),
(34, 'SAMSUNG GALAXY S25', 13500000, 16320000, 5, 'https://dienthoaihay.vn/images/products/2025/08/04/resized/galaxy-s25-titan-ba%CC%A3c_1754286776.jpg', 'samsung', 'Samsung Galaxy S25 chính hãng Samsung Việt Nam, tình trạng đã kích hoạt, FULLBOX đủ phụ kiện chuẩn đi kèm bao gồm củ sạc, dây sạc, sách HDSD. Sản phẩm còn bảo hành chính hãng tại các trung tâm bảo hành Samsung trên toàn quốc, và được bảo hành toàn diện 12 tháng cả nguồn, màn hình, vân tay tại Dienthoaihay.vn', 5, 0, NULL, NULL, NULL, 0),
(35, 'SAMSUNG GALAXY S24 ULTRAL', 16500000, 19600000, 5, 'https://dienthoaihay.vn/images/products/2025/06/12/resized/s24u-xa%CC%81m_1749700612.jpg', 'samsung', 'Samsung Galaxy S25 Ultra 5G chính hãng Samsung Việt Nam, tình trạng đã kích hoạt, FULLBOX đã mở seal, có thể xước xát nhẹ trong quá trình vận chuyển lưu kho. Sản phẩm còn bảo hành dài chính hãng tại các trung tâm bảo hành Samsung trên toàn quốc', 5, 0, NULL, NULL, NULL, 0),
(36, 'OPPO 50I', 2500000, 2850000, 10, 'https://dienthoaihay.vn/images/products/2026/03/14/resized/oppo-a5i-ti%CC%81m_1773449701.jpg', 'samsung', 'Máy mới nguyên seal 100% chưa qua sử dụng. Bộ phụ kiện chuẩn bao gồm thân máy, sạc, cáp, que chọc sim và sách hướng dẫn sử dụng. Duy nhất tại Dienthoaihay.vn sản phẩm được bảo hành VIP toàn diện cả nguồn, màn hình, vân tay', 5, 0, NULL, NULL, NULL, 0),
(37, 'VIVO Y19', 3090000, 3590000, 10, 'https://dienthoaihay.vn/images/products/2026/03/14/resized/vivo-y19s-4g-tra%CC%86%CC%81ng_1773449879.jpg', 'samsung', 'Vivo Y19S 4G chính hãng Vivo Việt Nam, tình trạng đã kích hoạt, FULLBOX đầy đủ phụ kiện sạc cáp, ốp lưng, sách hướng dẫn sử dụng, que lấy sim, máy có thể xước xát nhẹ trong quá trình vận chuyển lưu kho. Sản phẩm còn bảo hành dài chính hãng tại các trung tâm bảo hành Honor trên toàn quốc', 5, 0, NULL, NULL, NULL, 0),
(38, 'SAMSUNG GALAXY A26', 5290000, 6200000, 12, 'https://dienthoaihay.vn/images/products/2025/08/04/resized/galaxy-s24-fe-xanh-du%CC%9Bo%CC%9Bng_1754286475.jpg', 'samsung', 'Samsung Galaxy A26 5G chính hãng Samsung Việt Nam, tình trạng đã kích hoạt, FULLBOX đủ phụ kiện chuẩn đi kèm bao gồm củ sạc, dây sạc, sách HDSD. Sản phẩm còn bảo hành chính hãng tại các trung tâm bảo hành Samsung trên toàn quốc, và được bảo hành toàn diện 6 tháng cả nguồn, màn hình, vân tay tại Dienthoaihay.vn', 2, 0, NULL, NULL, NULL, 0),
(39, 'SAMSUNG GALAXY Z FLIP5', 12990000, 13500000, 3, 'https://dienthoaihay.vn/images/products/2025/06/19/resized/galaxy-flip-5-tim_1750303675.png', 'samsung', 'Samsung Galaxy Z Flip5 chính hãng Samsung Việt Nam, nguyên seal đã kích hoạt, đủ phụ kiện chuẩn đi kèm bao gồm dây sạc, sách HDSD. Sản phẩm còn bảo hành chính hãng tại các trung tâm bảo hành Samsung trên toàn quốc, và được bảo hành toàn diện 12 tháng cả nguồn, màn hình, vân tay tại Dienthoaihay.vn', 5, 0, NULL, NULL, NULL, 0),
(40, 'SAMSUNG GALAXY A04S', 1299000, 1350000, 3, 'https://dienthoaihay.vn/images/products/2023/02/12/resized/4_1676189458.jpg', 'samsung', 'Samsung Galaxy A04S chính hãng Samsung Việt Nam, tình trạng đã kích hoạt, FULLBOX đủ phụ kiện chuẩn đi kèm bao gồm củ sạc, dây sạc, sách HDSD. Sản phẩm được bảo hành toàn diện 6 tháng cả nguồn, màn hình, vân tay tại Dienthoaihay.vn', 5, 0, NULL, NULL, NULL, 0),
(41, 'SAMSUNG GALAXY A14', 2590000, 3200000, 6, 'https://dienthoaihay.vn/images/products/2023/07/20/resized/galaxy-a14-dong_1689815303.jpg', 'samsung', 'Samsung Galaxy A14 chính hãng Samsung Việt Nam, tình trạng đã kích hoạt, FULLBOX đủ phụ kiện chuẩn đi kèm bao gồm, dây sạc, sách HDSD. Sản phẩm còn bảo hành chính hãng tại các trung tâm bảo hành Samsung trên toàn quốc, và được bảo hành toàn diện 6 tháng cả nguồn, màn hình, vân tay tại Dienthoaihay.vn', 5, 0, NULL, NULL, NULL, 0),
(42, 'SAMSUNG GALAXY Z FLIP6', 14990000, 15590000, 3, 'https://dienthoaihay.vn/images/products/2024/07/11/resized/vn-galaxy-zflip6-f741-513550-sm-f741blgaxxv-542637095-copy_1720713854.jpg', 'samsung', 'Samsung Galaxy Z Flip6 chính hãng Samsung Việt Nam, tình trạng đã kích hoạt, FULLBOX đủ phụ kiện chuẩn đi kèm bao gồm củ sạc, dây sạc, sách HDSD. Sản phẩm còn bảo hành chính hãng tại các trung tâm bảo hành Samsung trên toàn quốc, và được bảo hành toàn diện 12 tháng cả nguồn, màn hình, vân tay', 4, 0, NULL, NULL, NULL, 0),
(44, 'IPHONE 15 PLUS', 16290000, 22990000, 2, 'https://dienthoaihay.vn/images/products/2025/08/04/resized/iphone-15_1754272917.jpg', 'iphone', NULL, 0, 0, NULL, NULL, NULL, 0),
(45, 'Apple Watch Ultra 49mm', 14590000, 17590000, 10, 'https://dienthoaihay.vn/images/products/2023/04/27/large/apple-watch-ultra_1682584054.jpg.jpg', 'iphone', NULL, 0, 0, NULL, NULL, NULL, 0),
(46, 'IPHONE XS', 8320000, 10250000, 3, 'https://dienthoaihay.vn/images/products/2020/06/21/resized/iphone-xs-vang_1592729267.jpg', 'iphone', NULL, 0, 0, NULL, NULL, NULL, 0),
(47, 'IPHONE X', 7650000, 9200000, 6, 'https://dienthoaihay.vn/images/products/2020/06/21/resized/iphone-x-bac_1592725310.jpg', 'iphone', NULL, 0, 0, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `fullname` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `is_admin`, `fullname`, `phone`, `address`) VALUES
(1, '0388292302', 'Vuvanhai1809@', 'admin', 0, 'Vũ Văn Hải', '0388292302', 'Hải Phòng'),
(2, 'vuvanhai', 'Vuvanhai1809@', 'user', 0, 'Vũ Văn Hải', '0388292302', 'Hải Dương');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
