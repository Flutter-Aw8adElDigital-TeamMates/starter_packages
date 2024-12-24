abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure() : super('No Internet connection.');
}
class ParsingFailure extends Failure {
  const ParsingFailure() : super('Failed to parse response');
}
class NoDataFailure extends Failure {
  const NoDataFailure() : super('No Data found');
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super('Unexpected error occurred.');
}

class OtherFailure extends Failure {
  const OtherFailure(String message) : super(message);
}
