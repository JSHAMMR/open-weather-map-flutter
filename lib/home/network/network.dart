
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import './utils/nothing.dart';
import './utils/request_type_exception.dart';
import './utils/request_type.dart';
import 'package:open_weather_map_flutter/utils/constants.dart';
class Network {

  final Client _client;
  Network(this._client);
  Future<Response> request ({@required RequestType requestType, @required String path, dynamic parameters= Nothing}) async {
    switch (requestType){
      case RequestType.GET :
        return _client.get("${Constants().getBasedUrl()}/$path");
      default :
        return throw RequestTypeNotFoundException("Wrong method");
    }
  }


}