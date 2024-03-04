class IndividualData {
  String? ticker;
  String? indices;
  String? tickerName;
  int? ltp;
  int? ltv;
  int? pointChange;
  double? percentageChange;
  double? open;
  int? high;
  double? low;
  int? volume;
  int? previousClosing;
  String? calculatedOn;
  double? amount;
  String? datasource;
  String? icon;
  List<ChartData>? chartData;

  IndividualData(
      {this.ticker,
      this.indices,
      this.tickerName,
      this.ltp,
      this.ltv,
      this.pointChange,
      this.percentageChange,
      this.open,
      this.high,
      this.low,
      this.volume,
      this.previousClosing,
      this.calculatedOn,
      this.amount,
      this.datasource,
      this.icon,
      this.chartData});

  IndividualData.fromJson(Map<String, dynamic> json) {
    ticker = json['ticker'];
    indices = json['indices'];
    tickerName = json['ticker_name'];
    ltp = (json['ltp'] as num?)?.toDouble()?.toInt();
    ltv = (json['ltv'] as num?)?.toDouble()?.toInt();
    pointChange = (json['point_change'] as num?)?.toDouble()?.toInt();
    percentageChange = json['percentage_change']?.toDouble();
    open = json['open']?.toDouble();
    high = (json['high'] as num?)?.toDouble()?.toInt();
    low = json['low']?.toDouble();
    volume = (json['volume'] as num?)?.toDouble()?.toInt();
    previousClosing = (json['previousClosing'] as num?)?.toDouble()?.toInt();
    calculatedOn = json['calculated_on'];
    amount = json['amount']?.toDouble();
    datasource = json['datasource'];
    icon = json['icon'];
    if (json['chartData'] != null) {
      chartData = <ChartData>[];
      json['chartData'].forEach((v) {
        chartData!.add(ChartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ticker'] = ticker;
    data['indices'] = indices;
    data['ticker_name'] = tickerName;
    data['ltp'] = ltp;
    data['ltv'] = ltv;
    data['point_change'] = pointChange;
    data['percentage_change'] = percentageChange;
    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['volume'] = volume;
    data['previousClosing'] = previousClosing;
    data['calculated_on'] = calculatedOn;
    data['amount'] = amount;
    data['datasource'] = datasource;
    data['icon'] = icon;
    if (chartData != null) {
      data['chartData'] = chartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartData {
  double? value;
  String? timestamp;

  ChartData({this.value, this.timestamp});

  ChartData.fromJson(Map<String, dynamic> json) {
    value = json['value']?.toDouble();
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['value'] = value;
    data['timestamp'] = timestamp;
    return data;
  }
}
