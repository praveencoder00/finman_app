import 'package:finman_app/theme/app_theme.dart';
import 'package:finman_app/utils/animations.dart';
import 'package:finman_app/utils/widgets_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final categories = [
    {'name': 'Housing', 'amount': 950.0, 'color': const Color(0xFFFF6B00)},
    {'name': 'Food', 'amount': 650.0, 'color': const Color(0xFFD94135)},
    {'name': 'Transport', 'amount': 450.0, 'color': const Color(0xFF07883F)},
    {'name': 'Other', 'amount': 450.0, 'color': const Color(0xFF7B6B63)},
  ];
  bool isDay = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffBackground,
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Sunday · September 20',
                style: TextStyle(fontSize: 18, color: AppTheme.grey),
              ),
              Text(
                'Financial overview',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  WidgetsUtils().overviewContainer(
                    'Total income',
                    '₹7,280',
                    'assets/icons/receipt.svg',
                    '37% of budget',
                    borderColor: AppTheme.orange,
                    backColor: const Color.fromARGB(255, 255, 216, 179),
                  ),

                  SizedBox(width: 16),
                  WidgetsUtils().overviewContainer(
                    'Total income',
                    '₹7,280',
                    'assets/icons/receipt.svg',
                    '37% of budget',
                    backColor: Color(0xffDCF7E1),
                    borderColor: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  WidgetsUtils().overviewContainer(
                    'Total income',
                    '₹7,280',
                    'assets/icons/receipt.svg',
                    '37% of budget',
                  ),

                  SizedBox(width: 16),
                  WidgetsUtils().overviewContainer(
                    'Total income',
                    '₹7,280',
                    'assets/icons/receipt.svg',
                    '37% of budget',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.border, width: 0.4),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Spending by category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Where your Money went',
                      style: AppTheme().subHeading(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentGeometry.center,
                          children: [
                            SizedBox(
                              height: 240,
                              width: 240,
                              child: PieChart(
                                PieChartData(
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 60,
                                  sections: categories
                                      .map(
                                        (category) => PieChartSectionData(
                                          value: category['amount'] as double,
                                          color: category['color'] as Color,
                                          showTitle: false,
                                          radius: 35,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Total',
                                  style: AppTheme().subHeading(size: 14),
                                ),
                                Text(
                                  '₹2.5k',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: categories.map((category) {
                              double total = categories.fold<double>(
                                0,
                                (sum, item) => sum + (item['amount'] as double),
                              );

                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: category['color'] as Color,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      category['name'] as String,
                                      style: AppTheme().subHeading(size: 14),
                                    ),
                                  ),

                                  Align(
                                    alignment: AlignmentGeometry.centerRight,
                                    child: Text(
                                      '${(((category['amount'] as double) / total) * 100).round()}%',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.border, width: 0.3),
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 228, 217),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          AnimatedButton(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isDay ? AppTheme.orange : null,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Day',
                                style: !isDay
                                    ? AppTheme().subHeadingBold(size: 16)
                                    : TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                isDay = true;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          AnimatedButton(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: !isDay ? AppTheme.orange : null,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Month',
                                style: isDay
                                    ? AppTheme().subHeadingBold(size: 16)
                                    : TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                isDay = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/calender.svg',
                      color: AppTheme.orange,
                      height: 32,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Container(
                height: 400,
                 padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.border, width: 0.3),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Spent on',style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18
                    ),),
                    Text('September 23',style: AppTheme().subHeadingBold(),),

                    Divider(color: const Color.fromARGB(255, 218, 209, 197),),

                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 9,
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
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
