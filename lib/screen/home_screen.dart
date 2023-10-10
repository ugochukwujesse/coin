import 'package:crypto_app/service/exchange_rate_service.dart';
import 'package:crypto_app/utility/app_colour.dart';
import 'package:crypto_app/utility/app_font_size.dart';
import 'package:crypto_app/utility/app_font_weight.dart';
import 'package:crypto_app/utility/app_spacing.dart';
import 'package:crypto_app/widget/reusable_row.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var coinIconUrl =
      "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColour.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSpacing.s10,left: AppSpacing.s20,right: AppSpacing.s20),
              child: Column(
                children: [
                const  Row(
                    children: [
                      Spacer(),
                      Text("Track Coins",
                      style: TextStyle(
                        fontSize: AppFontSize.h20,
                        color: AppColour.white,
                        fontWeight: AppFontWeight.w500,
                      ),
                      ),
                      Spacer(),
                      Icon(Icons.check_box_outline_blank,
                      color: AppColour.white,
                      ),
                      SizedBox(width: AppSpacing.s10,),
                      Icon(Icons.notifications_none_rounded,
                      color:  AppColour.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.s20,),
                  TextField(
                    style:const  TextStyle(
                      color: AppColour.white
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                       borderRadius: BorderRadius.circular(40),
                      ),
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: AppColour.search,
                      prefixIcon:  Padding(
                        padding:  const EdgeInsets.only(left: AppSpacing.s20,right: AppSpacing.s20),
                        child:  Icon(Icons.search,
                        color: AppColour.white.withOpacity(0.5),
                          size: 20,
                        ),
                      ),
                      hintText: "Search coins",
                      hintStyle:  TextStyle(
                      color: AppColour.white.withOpacity(0.5),
                      fontWeight: AppFontWeight.w400,
                      fontSize: AppFontSize.h12,
                    ) ,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s30,),
                  const Row(
                    children: [
                       Text("FAVOURITES",
                       style: TextStyle(
                         letterSpacing: 2,
                         color: AppColour.white,
                         fontSize: AppFontSize.h12,
                         fontWeight: AppFontWeight.w500,
                       ),
                       ),
                      Spacer(),
                      Text("Large Cap",
                       style: TextStyle(
                         color: AppColour.lightBlue,
                         fontSize: AppFontSize.h12,
                         fontWeight: AppFontWeight.w500,
                       ),
                       ),
                      SizedBox(width: AppSpacing.s3,),
                      Icon(Icons.arrow_drop_down,
                      color: AppColour.lightBlue,
                        size: 20,
                      )
                    ],
                  ),
                   const SizedBox(height: AppSpacing.s20,),
                   FutureBuilder(
                     future: ExchangeRateService.fetchCrypto(),
                     builder: ( context, snapshot) {
                       final serviceData=snapshot.data;
                       if(snapshot.hasData){
                         print(snapshot.data);
                         return
                           SizedBox(
                             height: 1000,
                             child: ListView.builder(
                                 itemCount: serviceData!.data.length,
                                 itemBuilder: (context,index){
                                   return
                                   ReusableRow(data: data,
                                     number: serviceData.data[index].id.toString(),
                                     amount: serviceData.data[index].quote["USD"]!.price,
                                     marketCap: serviceData.data[index].numMarketPairs,
                                     nameOfProduct: serviceData.data[index].name,
                                     productAcronym: serviceData.data[index].symbol,
                                     // productLogo: Image.network("$coinIconUrl.${serviceData.data[index].symbol.toLowerCase()}png",)
                                   );

                                 }
                             ),
                           );
                     }
                       else{
                         print(snapshot.stackTrace);
                         print(snapshot.error);
                         return Text('Data: ${snapshot.error}');
                       }
                     },

                   ),

                ],
              ),
            )
        ),
      ),
    );
  }
}
