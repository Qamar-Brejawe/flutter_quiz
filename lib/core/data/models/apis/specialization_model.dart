class SpecializationModel {
  int? id;
  String? specializationName;
  String? image;
  int? collageId;

  SpecializationModel(
      {this.id, this.specializationName, this.image, this.collageId});

  SpecializationModel.fromJson(Map<String, dynamic> json) {
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
