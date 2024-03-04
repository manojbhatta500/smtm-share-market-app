class TickerDetailModel {
  String? ticker;
  String? tickerName;
  String? icon;
  String? sector;
  double? pointChange;
  double? percentageChange;

  TickerDetailModel({
    this.ticker,
    this.tickerName,
    this.icon,
    this.sector,
    this.pointChange,
    this.percentageChange,
  });

  factory TickerDetailModel.fromJson(Map<String, dynamic> json) {
    return TickerDetailModel(
      ticker: json['ticker'],
      tickerName: json['ticker_name'],
      icon: json['icon'],
      sector: json['sector'],
      pointChange: json['point_change']?.toDouble(), // Convert to double
      percentageChange: json['percentage_change']?.toDouble(),
    );
  }
}
