import 'package:flutter/cupertino.dart';
import 'package:chart_package/chart_package.dart';
import '../../../../data/chart_data/deals_conversion_ratio_data/converted_deals_conversion_ratio_data.dart';
import '../../../../data/chart_data/deals_conversion_ratio_data/deals_conversion_ratio_data.dart';
import '../../../../data/chart_data/products_by_product_name/converted_products_by_product_name_data.dart';
import '../../../../data/chart_data/products_by_product_name/products_by_product_name.dart';
import '../../../../data/chart_data/quater_wise_revenue_data/converted_quarter_wise_revenue_data.dart';
import '../../../../data/chart_data/quater_wise_revenue_data/quarter_wise_revenue_data.dart';
import '../../../../data/chart_data/sector_wise_deal_data/converted_sector_wise_deal_data.dart';
import '../../../../data/chart_data/sector_wise_revenue_data/converted_sector_wise_revenue_data.dart';
import '../../../../data/chart_data/sector_wise_revenue_data/sector_wise_revenue_data.dart';
import '../../../common_components_ios/custom_card_view_ios/custom_card_view_ios.dart';

class SummaryIos extends StatelessWidget {
  const SummaryIos({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SectorWiseDealData> sectorData = SectorDataUtils.getSectorWiseData();
    final sectorChartData = SectorChartData.fromRawData(rawSectorData);
    final productsByProductName = ProductByProductNameData.fromRawData(rawProductsByProductData);
    final quarterWiseRevenueData = QuarterWiseRevenueData.fromRawData(rawQuarterWiseRevenueData);
    final sectorWiseRevenueData = SectorWiseRevenueData.fromRawData(sectorWiseRevenue);

    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 233, 207, 170),

      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const CupertinoTextField(
              //   enabled: true,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   placeholder: 'Sector-Wise Deals',
              //   // decoration: BoxDecoration(
              //   //   border: Border(bottom: BorderSide(color: CupertinoColors.separator)),
              //   // ),
              // ),
              const Text(
                  'Sector-Wise Deals',

              ),
              const SizedBox(height: 8),
              CustomCardViewIos(
                widget: ChartComponent(
                  sectorData,
                  [],
                  true,
                  true,
                  ChartType.stackedColumnChart,
                ),
              ),
              // const CupertinoTextField(
              //   enabled: false,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   placeholder: 'Deals Conversion Ratio',
              //   decoration: BoxDecoration(
              //     border: Border(bottom: BorderSide(color: CupertinoColors.separator)),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Deals Conversion Ratio',
                ),
              ),
              CustomCardViewIos(
                widget: ChartComponent(
                  sectorChartData.xData,
                  sectorChartData.yData,
                  true,
                  true,
                  ChartType.pie,
                ),
              ),
              // const CupertinoTextField(
              //   enabled: false,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   placeholder: 'Products By Product Name',
              //   decoration: BoxDecoration(
              //     border: Border(bottom: BorderSide(color: CupertinoColors.separator)),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Products By Product Name',
                ),
              ),
              CustomCardViewIos(
                widget: ChartComponent(
                  productsByProductName.xData,
                  productsByProductName.yData,
                  true,
                  true,
                  ChartType.bar,
                ),
              ),
              // const CupertinoTextField(
              //   enabled: false,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   placeholder: 'Quarter Wise Revenue',
              //   decoration: BoxDecoration(
              //     border: Border(bottom: BorderSide(color: CupertinoColors.separator)),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Quarter Wise Revenue',
                ),
              ),
              CustomCardViewIos(
                widget: ChartComponent(
                  quarterWiseRevenueData.xData,
                  quarterWiseRevenueData.yData,
                  true,
                  true,
                  ChartType.columnChart,
                ),
              ),
              // const CupertinoTextField(
              //   enabled: false,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   placeholder: 'Sector Wise Revenue',
              //   decoration: BoxDecoration(
              //     border: Border(bottom: BorderSide(color: CupertinoColors.separator)),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Sector Wise Revenue',
                ),
              ),
              CustomCardViewIos(
                widget: ChartComponent(
                  sectorWiseRevenueData.xData,
                  sectorWiseRevenueData.yData,
                  true,
                  true,
                  ChartType.columnChart,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
