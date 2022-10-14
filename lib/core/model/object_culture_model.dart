class ObjectCultureModel {
  final String name;
  final int id;
  ObjectCultureModel(
    this.name,
    this.id,
  );

  factory ObjectCultureModel.fromJson(Map<String, dynamic> json) =>
      ObjectCultureModel(json['name'], json['id']);
}
