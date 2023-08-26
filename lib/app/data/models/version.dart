class Version{
  String? isUptodate;
  String? newVersion;
  String? link;
  String? isForceUpdate;

  Version();

  Version.fromJson(Map<String, dynamic> json) {
    try{
      isUptodate = (json['is_up_todate'] ?? 1).toString();
      newVersion = json['new_version'];
      link = json['link'];
      isForceUpdate = json['is_force_update'] ?? '0';
    }catch(e){}
  }
}