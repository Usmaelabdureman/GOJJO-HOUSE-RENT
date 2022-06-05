class Post {
  final int id;
  final String city;
  final String subcity;
  final int price;
  final String description;

  Post({
    required this.id,
    required this.city,
    required this.subcity,
    required this.price,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        city: json['city'],
        subcity: json['subcity'],
        price: json['price'],
        description: json['description']
       );
  }
}
