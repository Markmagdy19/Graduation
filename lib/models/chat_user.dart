class ChatUser {
  ChatUser({
    this.imageUrl,
    this.about,
    this.name,
    this.createdAt,
    this.isOnline,
    this.id,
    this.lastActive,
    this.email,
    this.pushToken,
  });
  late String? imageUrl;
  late String? about;
  late String? name;
  late String? createdAt;
  late bool? isOnline;
  late String? id;
  late String? lastActive;
  late String? email;
  late String? pushToken;

  ChatUser.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'] ?? '';
    about = json['about'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['created_at'] ?? '';
    isOnline = json['is_online'].toString() == "false" ?? false;
    id = json['id'] ?? '';
    lastActive = json['last_active'] ?? '';
    email = json['email'] ?? '';
    pushToken = json['push_token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    data['about'] = about;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['is_online'] = isOnline;
    data['id'] = id;
    data['last_active'] = lastActive;
    data['email'] = email;
    data['push_token'] = pushToken;
    return data;
  }
}
