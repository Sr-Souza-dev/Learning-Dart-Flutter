import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = 'AIzaSyAHedtQzJZCtg4ZQc29smmZIeqc_c6F1_Q';
const ID_CHANNEL = 'UCDg6gcNYfQRsZeODHFewEWg';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';


class Api{
  Future<List<Video>>pesquisar(String pesquisa)async{
    http.Response response = await http.get(Uri.parse(
      URL_BASE + 'search'
          '?part=snippet'
          '&type=video'
          '&maxResults=20'
          '&order=rating'
          '&key=$CHAVE_YOUTUBE_API'
          '&q=$pesquisa'
    ));
    if(response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
      return videos;
    }else {
      List<Video>list = [];
      return list;
    }
  }
}