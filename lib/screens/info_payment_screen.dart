// TODO Implement this library.
import 'package:app_ban_tranh/models/order.dart';
import 'package:app_ban_tranh/screens/PaymentProgressCurve.dart';
import 'package:app_ban_tranh/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class InfoPaymentScreen extends StatefulWidget {
  final List<OrderItem>? orderItems; // Thêm parameter để nhận danh sách items

  const InfoPaymentScreen({Key? key, this.orderItems}) : super(key: key);

  @override
  State<InfoPaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<InfoPaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _namecountryController = TextEditingController();
  final _namecityController = TextEditingController();
  final _addressController = TextEditingController();

  String selectedCountry = 'Việt Nam';
  String selectedCity = 'Hồ Chí Minh';
  bool saveInfo = false;

  final List<String> countries = [
    'Việt Nam',
    'Thái Lan',
    'Singapore',
    'USA',
    'Khác'
  ];
  final List<String> cities = [
    'Hồ Chí Minh',
    'Hà Nội',
    'Đà Nẵng',
    'Cần Thơ',
    'Khác'
  ];

  // Lấy danh sách items từ parameter hoặc sử dụng sample data
  List<OrderItem> get currentOrderItems {
    return widget.orderItems ?? OrderData.sampleOrders[0].items;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _namecountryController.dispose();
    _namecityController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thanh toán',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Hiển thị danh sách các artwork items
              ...currentOrderItems
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildArtworkCard(context, item),
                      ))
                  .toList(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PaymentProgressCurve(
                  progress: 0.5,
                  leftLabel: "Thông tin giao hàng",
                  rightLabel: "Phương thức thanh toán",
                ),
              ),

              const SizedBox(height: 24),

              // thông tin user
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildCustomerInfoSection(),
              ),

              const SizedBox(height: 20),

              // địa chỉ giao hàng
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildDeliveryAddressSection(),
              ),

              const SizedBox(height: 30),

              // hành động
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildActionButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerInfoSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thông tin khách hàng',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Name Field
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Tên đầy đủ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.person),
                // suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Vui lòng nhập họ và tên';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Phone Field
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('+84', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                    ],
                  ),
                ),
                // suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
                hintText: '(000) 000-00-00',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Vui lòng nhập số điện thoại';
                }
                if (!RegExp(r'^[0-9]{9,10}$').hasMatch(value.trim())) {
                  return 'Số điện thoại không hợp lệ';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Email Field
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.email),
                // suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Vui lòng nhập email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value.trim())) {
                  return 'Email không hợp lệ';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryAddressSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Địa chỉ giao hàng',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Country Dropdown
            DropdownButtonFormField<String>(
              value: selectedCountry,
              decoration: InputDecoration(
                labelText: 'Quốc gia',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.public),
              ),
              items: countries.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),

            // City Dropdown
            DropdownButtonFormField<String>(
              value: selectedCity,
              decoration: InputDecoration(
                labelText: 'Thành phố',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.location_city),
              ),
              items: cities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Address Field
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Địa chỉ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.location_on),
                // suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
                hintText:
                    '806 QL22, ấp Mỹ Hoà 3, Hóc Môn, Hồ Chí Minh, Việt Nam',
              ),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Vui lòng nhập địa chỉ';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Save Info Checkbox
            CheckboxListTile(
              title: const Text(
                'Lưu thông tin của tôi để xem sau',
                style: TextStyle(fontSize: 14),
              ),
              value: saveInfo,
              onChanged: (bool? value) {
                setState(() {
                  saveInfo = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: Colors.grey[400]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Quay lại',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Tiến hành chọn phương thức thanh toán
                _proceedToPaymentWithLoading();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Tiếp theo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _proceedToPaymentWithLoading() async {
    // Hiển thị loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Simulate saving data (có thể thay bằng API call thực tế)
    await Future.delayed(const Duration(seconds: 1));

    // Đóng loading
    Navigator.pop(context);

    // Tạo object chứa thông tin
    Map<String, dynamic> customerInfo = {
      'name': _nameController.text.trim(),
      'phone': _phoneController.text.trim(),
      'email': _emailController.text.trim(),
      'country': selectedCountry,
      'city': selectedCity,
      'address': _addressController.text.trim(),
      'saveInfo': saveInfo,
    };

    // Chuyển đến PaymentScreen với danh sách OrderItem
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentScreen(
          customerInfo: customerInfo,
          orderItems: currentOrderItems,
        ),
      ),
    );
  }

  Widget _buildArtworkCard(BuildContext context, OrderItem item) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey[400] ?? Colors.grey,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Artwork Image
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Artwork Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.paintingName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.artist,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (item.yearCreated != null)
                    Text(
                      'Năm: ${item.yearCreated}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[500],
                      ),
                    ),
                  if (item.material != null)
                    Text(
                      item.material!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[500],
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    'Kích thước: ${item.size}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    'Khung: ${item.frame}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${_formatPrice(item.price.toInt())} VNĐ',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'x${item.quantity}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  if (item.hasDiscount)
                    Text(
                      'Giá gốc: ${_formatPrice(item.originalPrice.toInt())} VNĐ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }
}
