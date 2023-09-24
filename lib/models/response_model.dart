import 'package:equatable/equatable.dart';

class ResponseModel extends Equatable {
  final bool status;
  final dynamic data;

  const ResponseModel({required this.status, required this.data});

  @override
  List<Object?> get props => [status, data];
}