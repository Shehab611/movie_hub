import 'package:equatable/equatable.dart';

final class MovieParameters extends Equatable {
  final int? pageNum;
  final String endPoint, languageCode;

  const MovieParameters({this.pageNum = 1,
      required this.endPoint,
      required this.languageCode});

  @override
  List<Object?> get props => [pageNum, endPoint];
}
