class CollegeModel {
  int? id;
  String? collageName;
  List<Specializations>? specializations;

  CollegeModel({this.id, this.collageName, this.specializations});

  CollegeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collageName = json['collage_name'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(new Specializations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['collage_name'] = this.collageName;
    if (this.specializations != null) {
      data['specializations'] =
          this.specializations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specializations {
  int? id;
  String? specializationName;
  Null? image;
  int? collageId;
  int? hasmaster;
  int? hasgrad;
  Null? createdAt;
  Null? updatedAt;

  Specializations(
      {this.id,
      this.specializationName,
      this.image,
      this.collageId,
      this.hasmaster,
      this.hasgrad,
      this.createdAt,
      this.updatedAt});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specializationName = json['specialization_name'];
    image = json['image'];
    collageId = json['collage_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['specialization_name'] = this.specializationName;
    data['image'] = this.image;
    data['collage_id'] = this.collageId;
    return data;
  }
}
