import 'package:dartz/dartz.dart';

abstract interface class Usecase<Type, Params> {
  Future<Either<String, Type>> call(Params params);
}