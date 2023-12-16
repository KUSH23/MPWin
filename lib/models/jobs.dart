class JobDataModel {

  final int? id;
  final String? comapanyname;
  final String? jobname;
  final bool? varnish;
  final bool? dripoff;
  final bool? printing;
  final bool? embosing;
  final bool? diecutting;
  final bool? pasting;
  final String? jobstatus;
  final DateTime? timestamp;

  JobDataModel({required this.id, required this.comapanyname,
    required this.jobname, required this.varnish, required this.dripoff,
    required this.printing, required this.embosing, required this.diecutting,
    required this.pasting, required this.jobstatus, required this.timestamp});

  factory JobDataModel.fromJson(Map<String, dynamic> json) => JobDataModel(
    id : json['id'],
    comapanyname : json['comapany_name'],
    jobname : json['job_name'],
    varnish : json['varnish'],
    dripoff : json['dripoff'],
    printing : json['printing'],
    embosing : json['embosing'],
    diecutting : json['die_cutting'],
    pasting : json['pasting'],
    jobstatus : json['job_status'],
    timestamp: DateTime.parse(json["timestamp"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id.toString(),
  //   "comapany_name": comapanyname,
  //   "job_name": jobname,
  //   "varnish": varnish,
  //   "dripoff": dripoff,
  //   "printing": printing,
  //   "embosing": embosing,
  //   "die_cutting": diecutting,
  //   "pasting": pasting,
  //   "job_status": jobstatus,
  //   "timestamp": timestamp?.toIso8601String(),
  // };

Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id.toString();
    data['comapany_name'] = comapanyname;
    data['job_name'] = jobname;
    data['varnish'] = varnish;
    data['dripoff'] = dripoff;
    data['printing'] = printing;
    data['embosing'] = embosing;
    data['die_cutting'] = diecutting;
    data['pasting'] = pasting;
    data['job_status'] = jobstatus;
    data['timestamp'] = timestamp?.toIso8601String();
    return data;
  }
}