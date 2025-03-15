class ProductModel {
  final String image;
  final String title;
  final String weight;
  final String price;
  final String oldPrice;
  final String discount;

  ProductModel({
    required this.image,
    required this.title,
    required this.weight,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      weight: json['weight'] ?? '',
      price: json['price'] ?? '',
      oldPrice: json['oldPrice'] ?? '',
      discount: json['discount'] ??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'weight': weight,
      'price': price,
      'oldPrice': oldPrice,
      'discount': discount,
    };
  }
}
