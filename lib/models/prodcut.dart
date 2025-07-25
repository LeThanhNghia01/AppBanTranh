class ArtworkItem {
  final String id; // Thêm thuộc tính id
  final String title;
  final String artist;
  final String price;
  final String description; // Mô tả
  final String imagePath; //ảnh chính
  final String? material;
  final String? yearcreated; // Năm sáng tác (có thể để null nếu không có)
  final String? category;
  final List<String> additionalImages; //danh sách ảnh phụ

  ArtworkItem({
    required this.id, // Thêm id vào constructor
    required this.title,
    required this.artist,
    required this.price,
    required this.description, // Mô tả
    required this.imagePath,
    required this.material,
    required this.category,
    required this.yearcreated, // Năm sáng tác

    this.additionalImages = const [],
  });
  //getter lấy tất cả ảnh chính và phụ
  List<String> get allImages => [imagePath, ...additionalImages];
}

// Dữ liệu mẫu cho các tác phẩm nghệ thuật ở trang chủ
final List<ArtworkItem> homenewArtworks = [
  ArtworkItem(
    id: '1', // Thêm id cho mỗi item
    title: 'Flower in Oddy',
    artist: 'LT Nghiax',
    price: 'Price on request',
    material: '',
    yearcreated: '2023', // Năm sáng tác
    category: 'Cổ điển',
    imagePath: 'assets/images/flowerstyle.jpg',
    description: '', // Mô tả mặc định là rỗng
  ),
  ArtworkItem(
    id: '2',
    title: 'Think',
    artist: 'Doonstrij2',
    price: 'Price on request',
    material: '',
    yearcreated: '2023',
    category: 'Hoa',
    description: 'A powerful piece depicting the struggles of war.',
    imagePath: 'assets/images/flowerstyle.jpg',
  ),
  ArtworkItem(
    id: '3',
    title: 'Old War',
    artist: 'Rune Quizzter',
    price: 'Price on request',
    material: '',
    yearcreated: '2023',
    category: 'Hiện đại',
    description: 'A powerful piece depicting the struggles of war.',
    imagePath: 'assets/images/flowerstyle.jpg',
  ),
  ArtworkItem(
    id: '4',
    title: 'Blood Falls',
    artist: 'Doonstrij2',
    price: 'Price on request',
    material: '',
    yearcreated: '2023',
    category: 'Hoa',
    description: 'A powerful piece depicting the struggles of war.',
    imagePath: 'assets/images/flowerstyle.jpg',
  ),
];

// Dữ liệu mẫu cho các tác phẩm nghệ thuật
final List<ArtworkItem> newArtworks = [
  ArtworkItem(
      id: '5',
      title: 'Flower in Oddy',
      artist: 'LT Nghiax',
      price: '100.000.000 VNĐ',
      description:
          'Từ sâu thẳm khu rừng, một bản giao hưởng sắc màu hiện lên, là khúc ca rực rỡ của những loài hoa dại được vẽ nên bằng nét chạm tinh tế. Mỗi đóa hoa như một kiệt tác thu nhỏ, bừng nở sức sống, cánh hoa nhẹ nhàng bung nở tựa đôi cánh lụa mỏng.',
      imagePath: 'assets/images/flowerstyle.jpg',
      category: 'Hoa',
      material: 'Acrylic',
      yearcreated: '1980',
      additionalImages: [
        'assets/images/bh1.jpg',
        'assets/images/bh2.jpg',
      ]),
  ArtworkItem(
    id: '6',
    title: 'Think',
    artist: 'Doonstrij2',
    price: '100.000.000 VNĐ',
    category: 'Hoa',
    description: 'A powerful piece depicting the struggles of war.',
    imagePath: 'assets/images/flowerstyle.jpg',
    yearcreated: '2023',
    material: '',
  ),
  ArtworkItem(
    id: '7',
    title: 'Old War',
    artist: 'Rune Quizzter',
    price: '100.000.000 VNĐ',
    category: 'Văn hoá',
    yearcreated: '2023',
    description: 'A powerful piece depicting the struggles of war.',
    imagePath: 'assets/images/flowerstyle.jpg',
    material: '',
  ),
  ArtworkItem(
    id: '8',
    title: 'Blood Falls',
    artist: 'Doonstrij2',
    yearcreated: '2023',
    category: 'Chân dung',
    price: '100.000.000 VNĐ',
    description: 'A powerful piece depicting the struggles of war.',
    imagePath: 'assets/images/flowerstyle.jpg',
    material: '',
  ),
  ArtworkItem(
    id: '9',
    title: 'Hoa Rừng',
    artist: 'Nghĩa',
    yearcreated: '2020',
    category: 'Hoa',
    price: '100.000.000 VNĐ',
    description: 'Vẻ đẹp thời đại của khoản khắt.',
    imagePath: 'assets/images/bh2.jpg',
    material: '',
  ),
];
//dữ liệu tác phẩm đấu giá
final List<ArtworkItem> DauGiaTP = [
  ArtworkItem(
      id: '1',
      title: 'Vạm Thiên',
      artist: 'NghiaLT',
      price: '129,000,000 VNĐ',
      description: 'Tác phẩm nghệ thuật đương đại',
      imagePath: 'assets/images/vam_thien.png',
      material: 'Sơn dầu trên canvas',
      category: 'Phong cảnh',
      yearcreated: '2004'),
  ArtworkItem(
      id: '2',
      title: 'Hoàng Hôn',
      artist: 'TranABC',
      price: '85,000,000 VNĐ',
      description: 'Bức tranh phong cảnh tuyệt đẹp',
      imagePath: 'assets/images/vam_thien.png',
      material: 'Acrylic',
      category: 'Phong cảnh',
      yearcreated: '2010'),
];
//dữ liệu mẫu cho phần sản phẩm trong giỏ hàng
final List<ArtworkItem> GioHang_TP = [
  ArtworkItem(
      id: '1',
      title: 'Chạng Vạn',
      artist: 'NghiaLT',
      price: '15000000',
      description: 'Hoa cỏ lá hẹ',
      imagePath: 'assets/images/bh2.jpg',
      material: 'material',
      category: 'Hoa',
      yearcreated: '2011'),
  ArtworkItem(
      id: '2',
      title: 'Chạng Vạn',
      artist: 'NghiaLT',
      price: '15000000',
      description: 'Hoa cỏ lá hẹ',
      imagePath: 'assets/images/bh2.jpg',
      material: 'material',
      category: 'Hoa',
      yearcreated: '2011'),
  ArtworkItem(
      id: '3',
      title: 'Chạng Vạn',
      artist: 'NghiaLT',
      price: '15000000',
      description: 'Hoa cỏ lá hẹ',
      imagePath: 'assets/images/bh2.jpg',
      material: 'material',
      category: 'Hoa',
      yearcreated: '2011'),
  ArtworkItem(
      id: '4',
      title: 'Chạng Vạn',
      artist: 'NghiaLT',
      price: '15000000',
      description: 'Hoa cỏ lá hẹ',
      imagePath: 'assets/images/bh2.jpg',
      material: 'material',
      category: 'Hoa',
      yearcreated: '2011'),
];
