class NoConnectionException implements Exception {
  final String message;
  NoConnectionException([this.message = 'No internet connection']);
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class ParsingException implements Exception {
  final String message;
  ParsingException([this.message = 'Error parsing data']);
}

class NoDataException implements Exception {
  NoDataException();
}

class OtherException implements Exception {
  final String message;
  final int statusCode;
  OtherException(this.message,this.statusCode);
}
