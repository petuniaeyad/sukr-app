class ChildData {
  String? age;
  String? childLink;
  String? childName;
  String? gender;
  String? height;
  String? nationalNumber;
  String? nickName;
  String? profilePic;
  String? typeOfDiabetes;
  String? weight;

  ChildData({
    this.age,
    this.childLink,
    this.childName,
    this.gender,
    this.height,
    this.nationalNumber,
    this.nickName,
    this.profilePic,
    this.typeOfDiabetes,
    this.weight,
  });

  ChildData.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    childLink = json['childLink'];
    childName = json['childName'];
    gender = json['gender'];
    height = json['height'];
    nationalNumber = json['nationalNumber'];
    nickName = json['nickName'];
    profilePic = json['profilePic'];
    typeOfDiabetes = json['typeOfDiabetes'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['childLink'] = childLink;
    data['childName'] = childName;
    data['gender'] = gender;
    data['height'] = height;
    data['nationalNumber'] = nationalNumber;
    data['nickName'] = nickName;
    data['profilePic'] = profilePic;
    data['typeOfDiabetes'] = typeOfDiabetes;
    data['weight'] = weight;
    return data;
  }
}
