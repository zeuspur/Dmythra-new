class HelpModel {
  String? helpid;
  String helpType;
  int helpNumber;
  String userid;


  HelpModel({
    this.helpid,
    required this.helpType,
    required this.helpNumber,
    required this.userid

  });

  factory HelpModel.fromMap(Map<String, dynamic> map) {
    return HelpModel(
      helpid: map['helpid'],
      helpType: map['helpType'],
      helpNumber: map['helpNumber'],
      userid:map['userid'],

    );
  }


  Map<String,dynamic> toMap(id){
    return {
      'helpid':id,
      'helpType':helpType,
      'helpNumber':helpNumber,
      'userid':userid,

    };
  }
}
