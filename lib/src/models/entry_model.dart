class EntryModel {
  final int id;
  final String name;
  final String description;
  final String category;
  final String image;

  EntryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.image,
  });

  factory EntryModel.fromMap(Map<String, dynamic> map) {
    return EntryModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      category: map['category'],
      image: map['image'],
    );
  }
}
