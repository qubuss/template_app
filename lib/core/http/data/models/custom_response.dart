import 'dart:convert';

import 'package:templateapp/core/errors/data/models/app_error.dart';

class CustomResponse<T> {
  final T? data;
  final AppError? error;
  CustomResponse({
    this.data,
    this.error,
  }) : assert(data != null || error != null);
  bool get gotData => data != null;

  Map<String, dynamic> toMap() => <String, dynamic>{'data': '$data', 'error': '$error'};

  @override
  String toString() => jsonEncode(toMap());

  CustomResponse<T> copyWith({
    T? data,
    AppError? error,
  }) {
    return CustomResponse<T>(
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
