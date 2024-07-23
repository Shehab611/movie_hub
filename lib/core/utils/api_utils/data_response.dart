import 'package:equatable/equatable.dart';

sealed class DataResponse extends Equatable {
  const DataResponse();

  @override
  List<Object?> get props => [];
}

final class SuccessDataResponse<T> extends DataResponse {
  final T data;

  const SuccessDataResponse(this.data);

  @override
  List<Object?> get props => [data];
}

final class FailureDataResponse<T> extends DataResponse {
  final T error;

  const FailureDataResponse(this.error);

  @override
  List<Object?> get props => [error];
}

abstract class Parameters extends Equatable {
  const Parameters();

  @override
  List<Object?> get props => [];
}

final class NoParameters extends Parameters {
  const NoParameters();
}
