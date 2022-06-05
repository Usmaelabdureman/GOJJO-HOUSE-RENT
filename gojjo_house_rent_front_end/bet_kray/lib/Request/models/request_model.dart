class UserRequest{
  final int id;
  final String city;
  final String subcity;
  final int bedroom;
  final String? description;
  UserRequest({
    required this.id,
    required this.city,
    required this.subcity,
    required this.bedroom,
    this.description
    });
    
    factory UserRequest.fromJson(Map<String,dynamic> json){
      return UserRequest(
        id: json['id'],
        city: json['city'], 
        subcity: json['subcity'],
        bedroom: json['bedroom'],
        description: json['description']);
    }


    Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "subcity": subcity,
        "description": description,
      };

  static fromMap(first) {}
}