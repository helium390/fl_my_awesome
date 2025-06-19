class AppError {
  String? errorCode;
  String? errorMessage;

  AppError({this.errorCode, this.errorMessage});

  factory AppError.fromJson(Map<String, dynamic> json) => AppError(
      errorCode: json['error_code'], errorMessage: json['error_message']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    return data;
  }
}
