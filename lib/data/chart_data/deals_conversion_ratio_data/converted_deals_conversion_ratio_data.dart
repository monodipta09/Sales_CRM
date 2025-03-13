class SectorChartData {
  final List<String> xData;
  final List<int> yData;

  SectorChartData({required this.xData, required this.yData});

  factory SectorChartData.fromRawData(List<Map<String, dynamic>> rawData) {
    List<String> keys = rawData.map((item) => item['key'] as String).toList();
    List<int> values = rawData.map((item) => item['value'] as int).toList();

    return SectorChartData(xData: keys, yData: values);
  }
}
