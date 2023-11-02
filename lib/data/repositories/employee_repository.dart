import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/employee_model.dart';

class EmployeeRepository {
  Future<List<Employee>> fetchEmployeeData() async {
    final response = await http.get(
      Uri.parse('https://dummy.restapiexample.com/api/v1/employees'),
    );

    if (response.statusCode == HttpStatus.ok) {
      final mapData = json.decode(response.body) as Map<String, dynamic>;
      final result = EmployeeResponse.fromJson(mapData);
      return result.data;
    } else {
      throw Exception('Failed to load employee data');
    }
  }
}
