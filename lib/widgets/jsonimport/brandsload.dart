class Brands {
  final String title;
  final String description;
  final String image;

  // Constructor
  Brands({
    required this.title,
    required this.description,
    required this.image,
  });

  // Factory constructor to create a new Brands instance from a map
  factory Brands.fromJson(Map<String, dynamic> json) {
    return Brands(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
