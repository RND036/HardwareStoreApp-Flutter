// models.dart
class Categories {
  final String title;
  final String image;

  Categories({required this.title, required this.image});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      title: json['title'],
      image: json['image'],
    );
  }
}

class Products {
  final String title;
  final String image;
  final String brand;
  final String price;
  final String discount;

  Products({
    required this.title,
    required this.image,
    required this.brand,
    required this.price,
    required this.discount,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      title: json['title'],
      image: json['image'],
      brand: json['brand'],
      price: json['price'],
      discount: json['discount'],
    );
  }
}
