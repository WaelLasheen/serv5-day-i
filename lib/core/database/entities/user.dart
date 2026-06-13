import 'package:objectbox/objectbox.dart';

// 1. This annotation tells ObjectBox that this class is a database table
@Entity()
class User {
  // 2. Every entity needs an ID property, initialized to 0 for new objects
  @Id()
  int id;

  String name;
  String email;

  // 3. A standard constructor
  User({
    this.id = 0,
    required this.name,
    required this.email,
  });
}