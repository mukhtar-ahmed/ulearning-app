class UserProfile {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? openID;
  int? online;

  UserProfile({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.openID,
    this.online,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (type != null) data['type'] = type;
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (email != null) data['email'] = email;
    if (phone != null) data['phone'] = phone;
    if (avatar != null) data['avatar'] = avatar;
    if (openID != null) data['openID'] = openID;
    if (online != null) data['online'] = online;
    return data;
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        type: json['type'],
        name: json['name'],
        description: json['description'],
        email: json['email'],
        phone: json['phone'],
        avatar: json['avatar'],
        openID: json['openID'],
        online: json['online'],
      );
}
