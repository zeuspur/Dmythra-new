class PostModel {
  String? postid;
  String postPic;
  String postBio;
  String userid;


  PostModel({
     this.postid,
    required this.postPic,
    required this.postBio,
    required this.userid

  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postid: map['postid'],
      postPic: map['postPic'],
      postBio: map['postBio'],
      userid:map['userid'],

    );
  }


  Map<String,dynamic> toMap(id){
    return {
      'postid':id,
      'postPic':postPic,
      'postBio':postBio,
      'userid':userid,

    };
  }
}
