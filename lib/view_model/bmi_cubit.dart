import 'package:bmi_calculator/model/bmi_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  Future<void> calculationBmi(String weidth, String height) async {
    try {
      var dio = Dio();
      emit(BmiLoading());
      print("loaded");
      // print(BmiModel.fromJson(json));

      final res = await dio.get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {
          "weight": weidth,
          "height": height,
          "unit": "metric",
          "age": 30,
          "gender": "male",
          "activityLevel": "moderate",
        },
        options: Options(
          headers: {"x-api-key": "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d"},
        ),
      );
      final data = BmiModel.fromJson(res.data);
      print("success");

      emit(BmiSuccess(data: data));
    } catch (e) {
      print("failed");

      emit(BmiFailure(e.toString()));
    }
  }
}
