// user.dart
class User {
  final String username;
  final String email;
  final String token;

  User({required this.username, required this.email, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      token: json['token'],
    );
  }
}

// product.dart
class Product {
  final String name;
  final String description;

  Product({required this.name, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
    );
  }
}
