class AttendenceModel {
  String id;
  String docId; //doc id is a foriegn key
  String commonId; //doc id is a foriegn key
  String name;
  String sections;
  bool isPresent;
  String date;

  AttendenceModel(
      {required this.id,
      required this.docId,
      required this.commonId,
      required this.name,
      required this.sections,
      required this.date,
      required this.isPresent});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "doc_id": docId,
      "common_id": commonId,
      "name": name,
      "is_present": isPresent,
      "date": date,
      "sections": sections
    };
  }
}
