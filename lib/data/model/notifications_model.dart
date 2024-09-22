class NotificationsModel {
  int? id;
  int? clientId;
  String? description;
  String? type;
  String? createdAt;
  String? updatedAt;

  NotificationsModel(
      {this.id,
      this.clientId,
      this.description,
      this.type,
      this.createdAt,
      this.updatedAt});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    description = json['description'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['description'] = this.description;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
