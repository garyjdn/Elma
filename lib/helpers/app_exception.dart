class AppException implements Exception {
  final String title;
  final String msg;
  final String cause;

  AppException({
    this.title, 
    this.msg, 
    this.cause
  });
}