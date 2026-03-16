// ignore_for_file: use_rethrow_when_possible

import 'package:dio/dio.dart';

class BmiViewModel {
  Future<Map<String, dynamic>> calculationBmi(
    String weidth,
    String height,
  ) async {
    try {
      var res = await Dio().get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {"weight": weidth, "height": height, "unit": "metric"},
        options: Options(
          headers: {"x-api-key": "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d"},
        ),
      );
      return res.data;
    } catch (e) {
      throw e;
    }
  }
}
