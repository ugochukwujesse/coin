
import 'package:crypto_app/utility/app_colour.dart';
import 'package:crypto_app/utility/app_font_size.dart';
import 'package:crypto_app/utility/app_font_weight.dart';
import 'package:crypto_app/utility/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ReusableRow extends StatefulWidget {
  ReusableRow({
    super.key,
    required this.data,
    required this.number,
    required this.amount,
    required this.marketCap,
    required this.nameOfProduct,
    required this.productAcronym,
    required this.productLogo,
  });

  final List<_SalesData> data;
  String number;
  String nameOfProduct;
  Widget productLogo;
  double amount;
  String productAcronym;
  int marketCap;

  @override
  State<ReusableRow> createState() => _ReusableRowState();
}

class _ReusableRowState extends State<ReusableRow> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width:AppSpacing.s30,
              child: Text(widget.number,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: AppColour.white,
                  fontSize: AppFontSize.h12,
                  fontWeight: AppFontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.s10,),
            widget.productLogo,
            const SizedBox(width: AppSpacing.s5,),
            Container(
              child: Expanded(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(widget.nameOfProduct,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        color: AppColour.white,
                        fontWeight: AppFontWeight.w400,
                        fontSize: AppFontSize.h16,
                      ),
                    ),
                    Text(widget.productAcronym,
                      style: TextStyle(
                        color: AppColour.white.withOpacity(0.5),
                        fontSize: AppFontSize.h12,
                        fontWeight: AppFontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              child: Expanded(
                child: SfSparkLineChart.custom(
                  width: 0.5,
                  axisLineWidth: 0,
                  trackball: const SparkChartTrackball(
                      shouldAlwaysShow: false,
                      activationMode: SparkChartActivationMode.tap),
                  marker: const SparkChartMarker(
                    borderWidth: 0,
                    displayMode: SparkChartMarkerDisplayMode.all,
                  ),
                  // labelDisplayMode: SparkChartLabelDisplayMode.all,
                  xValueMapper: (int index) => widget.data[index].year,
                  yValueMapper: (int index) => widget.data[index].sales,
                  dataCount: 5,
                ),
              ),
            ),
            const Spacer(),
            Container(
              child: Expanded(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(widget.amount.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: AppColour.white,
                        fontWeight: AppFontWeight.w400,
                        fontSize: AppFontSize.h16,
                      ),
                    ),
                    Text(widget.marketCap.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColour.white.withOpacity(0.5),
                        fontSize: AppFontSize.h12,
                        fontWeight: AppFontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
        const  SizedBox(height: AppSpacing.s5,),
         Divider(
          thickness: 1,
          color: AppColour.white.withOpacity(0.3),
        ),
        const SizedBox(height: AppSpacing.s5,)
      ],
    );

  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
List<_SalesData> data = [
  _SalesData('Jan', 35),
  _SalesData('Feb', 28),
  _SalesData('Mar', 34),
  _SalesData('Apr', 32),
  _SalesData('May', 40)
];