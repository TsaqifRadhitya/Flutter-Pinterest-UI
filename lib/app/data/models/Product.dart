class Product {
  final int id ;
  final String title ;
  final String description ;
  final String category;
  final String image;
  final Map<String,dynamic> rating;

  Product({required this.id,required this.title,required this.description,required this.category,required this.image, required this.rating});

  factory Product.fromJson(Map<String,dynamic> json){
    Map<String,dynamic> rating = new Map<String,dynamic>();
    rating['rate'] = double.parse(json['rating']['rate'].toString());
    rating['count'] = int.parse(json['rating']['count'].toString());
    return Product(id: json["id"], title: json["title"], description: json["description"], category: json["category"], image: json["image"], rating: rating);
  }
}