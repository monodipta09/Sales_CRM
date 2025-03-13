class SectorWiseRevenueData {
  final List<String> xData;
  final List<double> yData;

  SectorWiseRevenueData({required this.xData, required this.yData});

  factory SectorWiseRevenueData.fromRawData(List<Map<String, dynamic>> rawData) {
    List<String> keys = rawData.map((item) => item['sector'] as String).toList();
    List<double> values = rawData.map((item) => item['sumOfActualRevenue'] as double).toList();

    return SectorWiseRevenueData(xData: keys, yData: values);
  }
}