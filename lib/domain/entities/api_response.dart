class ApiResponse {
  String? message;
  bool? success;
  dynamic data;

  ApiResponse({this.message, this.success, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        message: json['message'],
        success: json['success'],
        data: json['data'],
      );
}
