class ProductByProductNameData {
  final List<String> xData;
  final List<int> yData;

  ProductByProductNameData({required this.xData, required this.yData});

  factory ProductByProductNameData.fromRawData(List<Map<String, dynamic>> rawData) {
    List<String> keys = rawData.map((item) => item['typeOfProduct'] as String).toList();
    List<int> values = rawData.map((item) => item['productsCount'] as int).toList();

    return ProductByProductNameData(xData: keys, yData: values);
  }
}