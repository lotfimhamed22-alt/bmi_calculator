class BmiModel {
  // data
  final String status;
  final dynamic error;
  final BmiData data;
  // constructor
  BmiModel({required this.status, required this.error, required this.data});
  // factory constructor
  factory BmiModel.fromJson(Map<String, dynamic> json) => BmiModel(
    status: json["status"],
    error: json["error"],
    data: BmiData.fromJson(json["data"]),
  );
}

class BmiData {
  // data
  final String height;
  final String weight;
  final double bmi;
  final String risk;
  final String summary;
  final String recommendation;
  // constructor
  BmiData({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.risk,
    required this.summary,
    required this.recommendation,
  });
  // factory constructor
  factory BmiData.fromJson(Map<String, dynamic> json) => BmiData(
    height: json["height"],
    weight: json["weight"],
    bmi: json["bmi"],
    risk: json["risk"],
    summary: json["summary"],
    recommendation: json["recommendation"],
  );
}
