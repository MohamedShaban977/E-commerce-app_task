import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';

abstract class UseCase<Type ,Params>{
  Future <Either<Failure ,Type>> call(Params params);
}


abstract class UseCase2<Type ,Params>{

  Future <Either<ServerException ,Type>> call(Params params);
}


class NoParams extends Equatable {
  @override
  List<Object?> get props => [];

}