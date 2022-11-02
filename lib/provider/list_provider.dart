import 'dart:convert';
import 'dart:developer';

import 'package:alobha_test/model/employee_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ListProvider with ChangeNotifier {
  List<EmployeeData> data = [];
  List<EmployeeData> mainList = [];
  bool isLoading = false;

  ListProvider() {
    getData();
  }

  filterResult(String value) {
    if (value.isNotEmpty) {
      data.clear();
      for (var element in mainList) {
        if (element.facilities != null &&
            element.facilities![0].facilityId
                .toString()
                .contains(value.trim())) {
          data.add(element);
        }
      }
      notifyListeners();
    } else {
      data.clear();
      mainList.forEach((element) {
        data.add(element);
      });
      notifyListeners();
    }
  }

  getData() async {
    isLoading = true;
    notifyListeners();
    Map<String, String> headers = Map();
    headers['Accept'] = 'application/json';
    headers['content-type'] = 'application/json';
    headers['Authorization'] =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyIiwibmJmIjoxNjY2OTU0NTEzLCJleHAiOjE2NjcwNDA5MTMsImlhdCI6MTY2Njk1NDUxM30.EXEzTX8-MHQqZuuILwHGoQ0Vpw2fAgsi2QypGNFgMAE';
    headers['userId'] = 'application/json';
    var response = await http.get(
        Uri.parse('http://47.254.237.237:81/api/Users/GetAllUser'),
        headers: headers);
    for (var element in jsonDecode(response.body)) {
      mainList.add(EmployeeData.fromJson(element));
    }
    filterResult('');
    isLoading = false;
    notifyListeners();
  }
}
