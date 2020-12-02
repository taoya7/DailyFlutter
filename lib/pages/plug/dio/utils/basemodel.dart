

class BaseModel {
  String message;
  int code;
  dynamic data;

  BaseModel({this.message, this.message, this.data});

  BaseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    data['data'] = this.data;
    return data;
  }
}