class Post {
  final int id;
  String author;
  String content;
  DateTime createdAt;
  bool isEnabled;
  int number;
  Gender authorGender;

  Post({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
    required this.isEnabled,
    required this.number,
    required this.authorGender,
  });
}

enum Gender {
  male("Male"),
  female("Female"),
  unespecified("Unspecified");

  const Gender(this.name);

  final String name;
}
