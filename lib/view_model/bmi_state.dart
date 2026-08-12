part of 'bmi_cubit.dart';

sealed class BmiState {}

final class BmiInitial extends BmiState {}

final class BmiLoading extends BmiState {}

final class BmiSuccess extends BmiState {
  final BmiModel data;

  BmiSuccess({required this.data});
}

final class BmiFailure extends BmiState {
  final String message;
  BmiFailure(this.message);
}
