import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/model/bmi_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  Future<void> calculationBmi(
      String weidth,
      String height,
      ) async {
    emit(BmiLoading());
    try {
      var res = await Dio().get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {"weight": weidth, "height": height, "unit": "metric"},
        options: Options(
          headers: {"x-api-key": "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d"},
        ),
      );
      var data = BmiModel.fromJson(res.data);
      BmiSuccess(data);
    } catch (e) {
      emit(BmiFailure(e.toString()));
      throw e;
    }
  }
}
