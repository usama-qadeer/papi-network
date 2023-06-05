class GetNEWSModel {
  bool? status;
  String? message;
  List<News>? news;

  GetNEWSModel({this.status, this.message, this.news});

  GetNEWSModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['News'] != null) {
      news = <News>[];
      json['News'].forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.news != null) {
      data['News'] = this.news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  int? id;
  String? image;
  String? title;
  String? date;
  String? numberOfLike;
  String? pdf;
  String? createdAt;
  String? updatedAt;

  News(
      {this.id,
      this.image,
      this.title,
      this.date,
      this.numberOfLike,
      this.pdf,
      this.createdAt,
      this.updatedAt});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    date = json['date'];
    numberOfLike = json['number_of_like'];
    pdf = json['pdf'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['date'] = this.date;
    data['number_of_like'] = this.numberOfLike;
    data['pdf'] = this.pdf;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
