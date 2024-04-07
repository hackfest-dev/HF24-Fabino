import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gov_help_india/common/snackbar/snackbars.dart';
import 'package:gov_help_india/utils/helpers/helper_functions.dart';
import 'package:http/http.dart' as http;

import '../../features/raise_issue/model/UserIssue.dart';

class ApiHandler {
  static const String _BASE_URL = "http://192.168.137.211:5000";

  static Future<void> postNewIssue(UserIssue data) async {

    final String url = "$_BASE_URL/create_issue";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data.toJson()), // Convert model to JSON
      );

      if (response.statusCode == 201) {
        print('Response data: ${response.body}');
        Get.back(canPop: true);
        // THelperFunctions.showAlert('Response data:', response.body);
        TSnackBar.sucessSnackBar(title: 'Response data:', message: "Issue Successfully Created");

      } else {
        print('Failed to make POST request');
        print('Status code: ${response.statusCode}');
      }
    } catch (e) {
      THelperFunctions.showAlert('Error during POST request', e.toString());
      print(e);
    }
  }

  static Future<String?> getStateFromLatLong(double lat, double long) async {
    final String url = "https://nominatim.openstreetmap.org/reverse.php?lat=$lat&lon=$long&zoom=18&format=jsonv2";
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Parse JSON response
        final Map<String, dynamic> responseData = json.decode(response.body);
        // Extract the "state" field from the address object
        final String? state = responseData['address']?['state'];
        return state;
      } else {
        print('Failed to make GET request');
        print('Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during GET request: $e');
      return null;
    }
  }

  static Future<Map?> getFilteredIssue() async {
    final _storage = GetStorage();
    final dynamic location = _storage.read("location");

    final String url = "$_BASE_URL/filter_issues";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "latitude": location["latitude"],
          "longitude": location["longitude"],
        }), // Convert model to JSON
      );

      if (response.statusCode == 200) {
        Get.back(canPop: true);
        // THelperFunctions.showAlert('Response data:', response.body);=
        return jsonDecode(response.body);

      } else {
        print('Failed to make POST request');
        print('Status code: ${response.statusCode}');
      }
    } catch (e) {
      THelperFunctions.showAlert('Error during POST request', e.toString());
      print(e);
    }
    return null;
  }

  static Future<Map?> getHistory() async {
    final _storage = GetStorage();
    final dynamic user_id = _storage.read("user_uid");

    final String url = "$_BASE_URL/get_user_issues";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "user_id": user_id
        }), // Convert model to JSON
      );

      if (response.statusCode == 200) {
        print(response.body);
        // THelperFunctions.showAlert('Response data:', response.body);=
        return jsonDecode(response.body);

      } else {
        print('Failed to make POST request');
        print('Status code: ${response.statusCode}');
      }
    } catch (e) {
      THelperFunctions.showAlert('Error during POST request', e.toString());
      print(e);
    }
    return null;
  }

  static Future<Map?> addSupport(String issueId) async {

    final String url = "$_BASE_URL/inc_support";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "issue_id": issueId
        }), // Convert model to JSON
      );

      if (response.statusCode == 200) {
        print(response.body);
        // THelperFunctions.showAlert('Response data:', response.body);=
        return jsonDecode(response.body);

      } else {
        print('Failed to make POST request');
        print('Status code: ${response.statusCode}');
      }
    } catch (e) {
      THelperFunctions.showAlert('Error during POST request', e.toString());
      print(e);
    }
    return null;
  }

  static Future<Map?> addReport(String issueId) async {

    final String url = "$_BASE_URL//inc_report";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "issue_id": issueId
        }), // Convert model to JSON
      );

      if (response.statusCode == 200) {
        print(response.body);
        // THelperFunctions.showAlert('Response data:', response.body);=
        return jsonDecode(response.body);

      } else {
        print('Failed to make POST request');
        print('Status code: ${response.statusCode}');
      }
    } catch (e) {
      THelperFunctions.showAlert('Error during POST request', e.toString());
      print(e);
    }
    return null;
  }
}
