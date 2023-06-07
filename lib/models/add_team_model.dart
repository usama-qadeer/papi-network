class AddTeamMemberModel {
  int? status;
  String? message;
  Team? team;

  AddTeamMemberModel({this.status, this.message, this.team});

  AddTeamMemberModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    team = json['Team'] != null ? new Team.fromJson(json['Team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.team != null) {
      data['Team'] = this.team!.toJson();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? userName;
  String? image;
  String? email;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  bool? addTeam;

  Team(
      {this.id,
      this.name,
      this.userName,
      this.image,
      this.email,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt,
      this.addTeam});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    image = json['image'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addTeam = json['add_team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['add_team'] = this.addTeam;
    return data;
  }
}
