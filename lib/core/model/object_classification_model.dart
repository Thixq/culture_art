class ObjectClassificationModel {
  final String name;
  final int id;

  ObjectClassificationModel(this.name, this.id);

  factory ObjectClassificationModel.fromJson(Map<String, dynamic> json) =>
      ObjectClassificationModel(json['name'], json['id']);
}
