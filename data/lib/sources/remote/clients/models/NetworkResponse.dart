class NetworkResponse<T> {
  final int statusCode;
  final T? data;
  final String? message;

  NetworkResponse({
    required this.statusCode,
    this.data,
    this.message,
  });
}
