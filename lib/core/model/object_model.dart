class ObjectModel {
  final int? id;
  final String? title;
  final String? description;
  final String? division;
  final List<Worktypes>? worktypes;
  final List<People>? people;
  final String? dated;
  final String? culture;
  final String? classification;
  final String? department;
  final List<Images>? images;
  final List<ColorPalette>? colors;
  final String? objectnumber;
  final String? technique;

  ObjectModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.division,
      required this.worktypes,
      required this.people,
      required this.dated,
      required this.culture,
      required this.classification,
      required this.department,
      required this.images,
      required this.colors,
      required this.objectnumber,
      required this.technique});

  factory ObjectModel.fromJson(Map<String, dynamic> json) => ObjectModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Title not available',
      description: json['description'] ?? 'Description not available',
      division: json['division'] ?? 'Not available',
      worktypes: json.containsKey('worktypes')
          ? (json['worktypes'] as List).isNotEmpty
              ? (json['worktypes'] as List)
                  .map((e) => Worktypes.fromJson(e))
                  .toList()
              : [Worktypes(worktypeid: '0', worktype: 'not available')]
          : [Worktypes(worktypeid: '0', worktype: 'not available')],
      people: json['peoplecount'] != 0
          ? (json['people'] as List)
              .map(
                (e) => People.fromJson(e),
              )
              .toList()
          : [
              People(
                  culture: 'Unknown',
                  gender: 'Unknown',
                  name: 'Anonymous',
                  personid: 0,
                  role: 'Unknown'),
            ],
      dated: json['dated'] ?? 'Unknown',
      culture: json['culture'] ?? 'Unknown',
      classification: json['classification'] ?? 'Unknown',
      department: json['department'] ?? 'unknown',
      images: json['imagecount'] != 0
          ? ((json['images'] as List).isNotEmpty
              ? (json['images'] as List).map((e) => Images.fromJson(e)).toList()
              : [
                  Images(
                      baseimageurl:
                          'https://tandoorvietnam.com/wp-content/uploads/woocommerce-placeholder-600x600.png')
                ])
          : [
              Images(
                  baseimageurl:
                      'https://tandoorvietnam.com/wp-content/uploads/woocommerce-placeholder-600x600.png')
            ],
      colors: json['colorcount'] != 0
          ? (json['colors'] as List)
              .map((e) => ColorPalette.fromJson(e))
              .toList()
          : [ColorPalette(color: '#ffffff')],
      objectnumber: json['objectnumber'] ?? '',
      technique: json['technique'] ?? '');

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['division'] = division;
    if (worktypes != null) {
      data['worktypes'] = worktypes!.map((v) => v.toJson()).toList();
    }
    if (people != null) {
      data['people'] = people!.map((v) => v.toJson()).toList();
    }
    data['dated'] = dated;
    data['culture'] = culture;
    data['classification'] = classification;
    data['department'] = department;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    data['objectnumber'] = objectnumber;
    data['technique'] = technique;
    return data;
  }
}

class Worktypes {
  String? worktypeid;
  String? worktype;

  Worktypes({this.worktypeid, this.worktype});

  Worktypes.fromJson(Map<String, dynamic> json) {
    worktypeid = json['worktypeid'];
    worktype = json['worktype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['worktypeid'] = worktypeid;
    data['worktype'] = worktype;
    return data;
  }
}

class People {
  String? role;
  String? gender;
  String? culture;
  String? name;
  int? personid;

  People({this.role, this.gender, this.culture, this.name, this.personid});

  People.fromJson(Map<String, dynamic> json) {
    role = json['role'] ?? '';
    gender = json['gender'] ?? '';
    culture = json['culture'] ?? '';
    name = json['name'] ?? '';
    personid = json['personid'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['gender'] = gender;
    data['culture'] = culture;
    data['name'] = name;
    data['personid'] = personid;
    return data;
  }
}

class Images {
  String? baseimageurl;

  Images({this.baseimageurl});

  Images.fromJson(Map<String, dynamic> json) {
    baseimageurl = json['baseimageurl'] ??
        'https://tandoorvietnam.com/wp-content/uploads/woocommerce-placeholder-600x600.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['baseimageurl'] = baseimageurl;
    return data;
  }
}

class ColorPalette {
  String? color;

  ColorPalette({this.color});

  ColorPalette.fromJson(Map<String, dynamic> json) {
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    return data;
  }
}
