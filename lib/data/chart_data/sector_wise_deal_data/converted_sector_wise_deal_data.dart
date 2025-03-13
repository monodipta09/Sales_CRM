import 'package:chart_package/chart_package.dart';
import 'sector_wise_deal_data.dart';

class SectorDataUtils {
  static List<SectorWiseDealData> getSectorWiseData() {
    return rawSectorData.map((e) => SectorWiseDealData.fromMap(e)).toList();
  }
}
