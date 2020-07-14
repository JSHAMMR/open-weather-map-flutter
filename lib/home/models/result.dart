class Result<T>{
  Result._();
  factory Result.loading( T msg) = LoadingState<T>;
  factory Result.sucesss( T value) = SuccessState<T>;
  factory Result.error( T msg) = ErrorState<T>;

}

class LoadingState<T> extends Result<T> {
  final T msg;
  LoadingState(this.msg) : super._();
}
class ErrorState<T> extends Result<T> {
  final T msg;
  ErrorState(this.msg) : super._();
}
class SuccessState<T> extends Result<T> {
  final T msg;
  SuccessState(this.msg) : super._();
}