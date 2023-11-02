class EmployeeResponse {
  final String status;
  final List<Employee> data;
  final String message;

  EmployeeResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeResponse(
      status: json['status'],
      data: (json['data'] as List).map((i) => Employee.fromJson(i)).toList(),
      message: json['message'],
    );
  }
}

class Employee {
  final int id;
  final String name;
  final int salary;
  final int age;
  final String profileImage;

  Employee({
    required this.id,
    required this.name,
    required this.salary,
    required this.age,
    required this.profileImage,
  });

  String get nameFormatted => name.toLowerCase();

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['employee_name'],
      salary: json['employee_salary'],
      age: json['employee_age'],
      profileImage: json['profile_image'],
    );
  }
}
