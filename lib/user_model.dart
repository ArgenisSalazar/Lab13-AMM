class UserFields {
  static const List<String> values = [id, username, passphrase];
  static const String tableName = 'users';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String id = '_id';
  static const String username = 'username';
  static const String passphrase = 'passphrase';
}

class UserModel {
  int? id;
  final String username;
  final String passphrase;

  UserModel({
    this.id,
    required this.username,
    required this.passphrase,
  });

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.username: username,
        UserFields.passphrase: passphrase,
      };

  factory UserModel.fromJson(Map<String, Object?> json) => UserModel(
        id: json[UserFields.id] as int?,
        username: json[UserFields.username] as String,
        passphrase: json[UserFields.passphrase] as String,
      );

  UserModel copy({
    int? id,
    String? username,
    String? passphrase,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        passphrase: passphrase ?? this.passphrase,
      );
}
