import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://reqres.in/';

class UserApi {
  static List _users = [];
  static int length = 0;
  static Future<void> fetchUserDataFromApi(int pageNumber) async {
    try {
      var request = await http.get('${baseUrl}api/users?page=$pageNumber');
      if (request.statusCode == 200) {
        var jsonData = jsonDecode(request.body.toString());
        for (Map x in jsonData['data']) _users.add(x);
      } else {
        print('Error occured while fetching data.');
      }
    } catch (e) {
      print('Unable to get Api data: Exception-$e');
    }
  }

  static Future<List> getUserData() async {
    await fetchUserDataFromApi(1);
    await fetchUserDataFromApi(2);
//    print(_users);
    length = _users.length;
    return _users;
  }
}

void main() {
  UserApi.getUserData();
}
