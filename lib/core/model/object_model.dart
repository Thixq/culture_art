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
      title: json['title'] ?? 'title not available',
      description: json['descripton'] ?? 'description not available',
      division: json['division'] ?? 'not available',
      worktypes: (json['worktypes'] as List).isNotEmpty
          ? (json['worktypes'] as List)
              .map((e) => Worktypes.fromJson(e))
              .toList()
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
                  role: 'Unknown')
            ],
      dated: json['dated'] ?? '',
      culture: json['culture'] ?? '',
      classification: json['classification'] ?? '',
      department: json['department'] ?? '',
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['division'] = this.division;
    if (this.worktypes != null) {
      data['worktypes'] = this.worktypes!.map((v) => v.toJson()).toList();
    }
    if (this.people != null) {
      data['people'] = this.people!.map((v) => v.toJson()).toList();
    }
    data['dated'] = this.dated;
    data['culture'] = this.culture;
    data['classification'] = this.classification;
    data['department'] = this.department;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    data['objectnumber'] = this.objectnumber;
    data['technique'] = this.technique;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['worktypeid'] = this.worktypeid;
    data['worktype'] = this.worktype;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['culture'] = this.culture;
    data['name'] = this.name;
    data['personid'] = this.personid;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baseimageurl'] = this.baseimageurl;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    return data;
  }
}
