class MedicineModel {
  String? medicineid;
  String prescription;
  int phone;
  String description;
  String userID;


  MedicineModel({
    this.medicineid,
    required this.prescription,
    required this.phone,
    required this.description,
    required this.userID,

  });

  factory MedicineModel.fromMap(Map<String, dynamic> map) {
    return MedicineModel(
      medicineid: map['medicineid'],
      prescription: map['prescription'],
      phone: map['phone'],
      description:map['description'],
      userID:map['userID'],

    );
  }


  Map<String,dynamic> toMap(id){
    return {
      'medicineid':id,
      'prescription':prescription,
      'phone':phone,
      'description':description,
      'userID':userID,

    };
  }
}
