class Product {
  final int id;
  final String title;
  final dynamic price;
  final String category;
  final String description;
  final String image;

  Product(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image});

  factory Product.fromJson(dynamic json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        category: json['category'],
        description: json['description'],
        image: json['image']);
  }

  @override
  String toString() {
    return 'Product{id: $id, title: $title, price: $price, category: $category, description: $description, image: $image}';
  }
}
