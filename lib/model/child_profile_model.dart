import 'package:sukar/model/child_data_model.dart';

class ChildProfileModel {
  ChildData? childData;
  String? parentId;
  String? childDocId;

  ChildProfileModel({this.childData, this.parentId, this.childDocId});

  ChildProfileModel.fromJson(Map<String, dynamic> json) {
    childData =
        json['childData'] != null
            ? ChildData.fromJson(json['childData'])
            : null;
    parentId = json['parentId'];
    childDocId = json['childDocId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (childData != null) {
      data['childData'] = childData!.toJson();
    }
    data['parentId'] = parentId;
    data['childDocId'] = childDocId;
    return data;
  }
}
