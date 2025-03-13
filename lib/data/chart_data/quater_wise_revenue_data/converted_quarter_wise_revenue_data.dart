class QuarterWiseRevenueData {
  final List<String> xData;
  final List<double> yData;

  QuarterWiseRevenueData({required this.xData, required this.yData});

  factory QuarterWiseRevenueData.fromRawData(List<Map<String, dynamic>> rawData) {
    List<String> keys = rawData.map((item) => item['quarter'] as String).toList();
    List<double> values = rawData.map((item) => item['sumOfRevenue'] as double).toList();

    return QuarterWiseRevenueData(xData: keys, yData: values);
  }
}