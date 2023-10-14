import 'package:bloc_jsonplaceholder/core/error/failure.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef DataMap = Map<String, dynamic>;