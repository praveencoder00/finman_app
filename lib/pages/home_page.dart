import 'package:finman_app/theme/app_theme.dart';
import 'package:finman_app/utils/widgets_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int touchedIndex = -1;

  List<BarChartGroupData> showingGroups() => List.generate(
    7,
    (i) => switch (i) {
      0 => barGroupData(0, 5, i == touchedIndex),
      1 => barGroupData(1, 6.5, i == touchedIndex),
      2 => barGroupData(2, 5, i == touchedIndex),
      3 => barGroupData(3, 7.5, i == touchedIndex),
      4 => barGroupData(4, 9, i == touchedIndex),
      5 => barGroupData(5, 11.5, i == touchedIndex),
      6 => barGroupData(6, 6.5, i == touchedIndex),
      _ => throw Error(),
    },
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widget = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:AppTheme.scaffBackground,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Sunday · September 20',
                style: TextStyle(
                  fontSize: 18,
                  color: AppTheme.grey,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Good Morning,\nPraveen',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spent this month',
                                style: TextStyle(
                                  color: AppTheme.lightestOrange,
                                ),
                              ),
                              Text(
                                '₹2000',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'of your ₹4000 budget',
                                style: TextStyle(
                                  color: AppTheme.lightestOrange,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.all(8),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_outward_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(5),
                      minHeight: 5,

                      value: 0.5,
                      color: Colors.white,
                      backgroundColor: Colors.white30,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('50% used', style: TextStyle(color: Colors.white)),
                        Text(
                          '₹2000 Left',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.3, color: Colors.black45),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last 7 days',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Daily spending pattern',style: AppTheme().subHeading(),),
                    SizedBox(
                      height: 180,

                      width: double.infinity,
                      child: BarChart(
                        BarChartData(
                          gridData: FlGridData(show: false),
                          barGroups: showingGroups(),

                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: getTitles,
                                reservedSize: 38,
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                              getTooltipColor: (_) => Colors.blueGrey,
                              tooltipHorizontalAlignment:
                                  FLHorizontalAlignment.right,
                              tooltipMargin: 0,
                              getTooltipItem:
                                  (group, groupIndex, rod, rodIndex) {
                                    String weekDay = switch (group.x) {
                                      0 => 'Monday',
                                      1 => 'Tuesday',
                                      2 => 'Wednesday',
                                      3 => 'Thursday',
                                      4 => 'Friday',
                                      5 => 'Saturday',
                                      6 => 'Sunday',
                                      _ => throw Error(),
                                    };
                                    return BarTooltipItem(
                                      '$weekDay\n',
                                      TextStyle(
                                        color: AppTheme.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ((rod.toY - 1).toStringAsFixed(
                                            1,
                                          )).toString(),
                                          style: const TextStyle(
                                            color: Colors
                                                .white, //widget.touchedBarColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                            ),
                            touchCallback:
                                (FlTouchEvent event, barTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        barTouchResponse == null ||
                                        barTouchResponse.spot == null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = barTouchResponse
                                        .spot!
                                        .touchedBarGroupIndex;
                                  });
                                },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.3, color: Colors.black45),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today\'s Expense',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '3 Transactions',
                              style: TextStyle(color: AppTheme.grey),
                            ),
                          ],
                        ),
                        Text(
                          'View all >',
                          style: TextStyle(color: AppTheme.orange),
                        ),
                      ],
                    ),
                    Expanded(
                      
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        itemBuilder: ((context, index) {
                          return WidgetsUtils().expenseRecord(
                            'title',
                            120,
                            index %2==0?'Mandatory':'Avoidable',
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                
                children: [
                  Expanded(
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 0.3
                        ),
                        color: Colors.white
                    
                    
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Spent today',style: TextStyle(
                          color: AppTheme.grey
                        ),),
                        SizedBox(height: 3,),
                        Text('₹360',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                      ],),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.orange,
                          width: 0.3
                        ),
                        color: const Color.fromARGB(86, 255, 166, 82)
                    
                    
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Maybe saved',style: TextStyle(
                          color:AppTheme.grey
                        ),),
                        SizedBox(height: 3,),
                        Text('₹120',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: AppTheme.orange),)
                      ],),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}

BarChartGroupData barGroupData(int x, double y, bool isTouched) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        color: isTouched ? AppTheme.orange : AppTheme.lightestOrange,
        width: 35,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        backDrawRodData: BackgroundBarChartRodData(show: false),
      ),
    ],
  );
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(color: Colors.black54, fontSize: 14);
  String text = switch (value.toInt()) {
    0 => 'M',
    1 => 'T',
    2 => 'W',
    3 => 'T',
    4 => 'F',
    5 => 'S',
    6 => 'S',
    _ => '',
  };
  return SideTitleWidget(
    meta: meta,
    space: 13,
    child: Text(text, style: style),
  );
}
