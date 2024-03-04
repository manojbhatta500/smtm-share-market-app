class IndividualDataChartModel {
  String? ticker;
  double? percentageChange;
  List<ChartData>? chartData;

  IndividualDataChartModel(
      {this.ticker, this.percentageChange, this.chartData});

  IndividualDataChartModel.fromJson(Map<String, dynamic> json) {
    ticker = json['ticker'];
    percentageChange = json['percentageChange'];
    if (json['chartData'] != null) {
      chartData = <ChartData>[];
      json['chartData'].forEach((v) {
        chartData!.add(new ChartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticker'] = this.ticker;
    data['percentageChange'] = this.percentageChange;
    if (this.chartData != null) {
      data['chartData'] = this.chartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartData {
  double? value;
  String? timestamp;

  ChartData({this.value, this.timestamp});

  ChartData.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
