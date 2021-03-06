class Product {
  final int id;
  final String title;
  final dynamic price;
  final String category;
  final String description;
  final String image;
  final int rating;
  final String size;
  final String brand;

  Product({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.rating,
    this.size,
    this.brand
  });

  factory Product.fromJson(dynamic json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        category: json['category'],
        description: json['description'],
        image: json['image'],
        rating: json['rating'],
        size: json['size'],
        brand: json['brand']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "price": this.price,
      "category": this.category,
      "description": this.description,
      "image": this.image,
      "rating": this.rating,
      "size": this.size,
      "brand": this.brand,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, title: $title, price: $price, category: $category, description: $description, image: $image, rating: $rating, size: $size, brand: $brand}';
  }
}
