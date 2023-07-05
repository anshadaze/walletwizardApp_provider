import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walletwizard/screens/statiticsScreen/statiticsScreen.dart';

import '../../model/add_datamodel.dart';

// ValueNotifier<List<add_dataModel>>graphNotifier=ValueNotifier(AddListNotifier.value);

class pichartIncome extends StatefulWidget {
  const pichartIncome({super.key});

  @override
  State<pichartIncome> createState() => _pichartIncomeState();
}

class _pichartIncomeState extends State<pichartIncome> {
  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder(valueListenable: graphNotifier, 
    builder: (BuildContext context, List<add_dataModel>addList, Widget?child){
      var allIncome=addList.where((element) => element.moneytype=='Income').toList();
      return graphNotifier.value.isEmpty
      ?SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: size.height*0.2,),
            Image.asset('asset/notdataIcon/notDataIcon-removebg-preview.png'),
            ] ,
          ),
        ),
      )
      :SfCircularChart(
        series: <CircularSeries>[
          PieSeries<add_dataModel,String>(
            dataSource: allIncome,
            xValueMapper: (add_dataModel incomeDate,_)=>incomeDate.CategoryItem,
            yValueMapper: (add_dataModel incomeDate,_)=>int.parse(incomeDate.Amount),
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            )
          )
        ],
        legend: const Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.scroll,
          alignment: ChartAlignment.center
        ),
      );
      
    }
    ) ;
  }
}