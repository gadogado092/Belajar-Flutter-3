class ResponseData {
  final String? message;
  final Map? data;

  const ResponseData({
    this.message,
    this.data
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      message: json['message'],
      data: json['data'],
    );
  }
}