class Todo {
  final int id;
  final String title;
  final String description;
  final String category;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.category});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
    );
  }
}
