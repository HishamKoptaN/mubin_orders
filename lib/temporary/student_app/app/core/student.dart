class Student {
  late int? id;
  late String image;
  late String name;
  late String location;

  Student(this.name, this.image, this.location, {this.id});

  Student.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map["image"];
    location = map["course"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'course': location,
    };
  }
}
