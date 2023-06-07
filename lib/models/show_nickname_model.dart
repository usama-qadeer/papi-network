class ShowNickNameModel {
  bool? status;
  String? message;
  Profile? profile;

  ShowNickNameModel({this.status, this.message, this.profile});

  ShowNickNameModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? userId;
  String? userName;
  String? image;
  String? nickName;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
      this.userId,
      this.userName,
      this.image,
      this.nickName,
      this.createdAt,
      this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    image = json['image'];
    nickName = json['nick_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['image'] = this.image;
    data['nick_name'] = this.nickName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
