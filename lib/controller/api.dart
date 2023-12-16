import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/jobs.dart';


class FormController {

  // Google App Script Web URL.
  static const String URL = "https://script.google.com/macros/s/AKfycbyewfYo6JAzgwfxTbQ6g3RYFCtLkFbdQMEYrfP6SC2aXtr1v50ke23dF7qtXKFVEm4WeA/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  Future<bool> addJobs({required JobDataModel jobDataModel}) async {
    var url = "$URL?sheet=jobs";
    var client = http.Client();
    try{
      var response = await client.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json; charset=utf-8",
          },
          body: convert.jsonEncode(jobDataModel));
      if (response.statusCode == 302) {
        var url = response.headers["location"];
        response = await http.get(Uri.parse(url!));
        (print(convert.jsonDecode(response.body)["status"] + "addProduct1"));

      } else {
        (print(convert.jsonDecode(response.body)["status"]+"addProduct2"));
      }

      if(convert.jsonDecode(response.body)["status"]=="SUCCESS"){
        return true;
      }
      // print(results);
    } catch(e) {
      print(e.toString());
      return false;
    }
    return false;
  }


  Future<List<JobDataModel>> getJobsList(String? myitemname) async {
    var url = "$URL?sheet=jobs";
    List<JobDataModel> mydata=[];
    if(myitemname != null){url = "$URL?sheet=jobs&cat=$myitemname";}

    var client = http.Client();
    try{
      var response = await client.get(Uri.parse(url));
      var decodedResponse = jsonDecode(response.body);
      final results = decodedResponse["data"] as List;
      print(results);
      mydata = results.map((json) => JobDataModel.fromJson(json)).toList();
    } catch(e) {
      print(e.toString());
    }
    return mydata;
  }

}