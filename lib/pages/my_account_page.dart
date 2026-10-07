import 'package:finman_app/theme/app_theme.dart';
import 'package:finman_app/utils/animations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _DetailsListPageState();
}

class _DetailsListPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffBackground,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Your Money, Your Plan',
                style: TextStyle(fontSize: 18, color: AppTheme.grey),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'My account',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
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
                                'Money available',
                                style: TextStyle(
                                  color: AppTheme.lightestOrange,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '₹2000',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: AppTheme.lightestOrange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '₹350 cash',
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
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/wallet.svg',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.border, width: 0.3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(142, 255, 166, 82),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.attach_money_outlined,
                            color: AppTheme.orange,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monthly plan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Set a limit for everything',
                              style: AppTheme().subHeading(size: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: AppTheme.border),
                    SizedBox(height: 20),
                    Text(
                      'Monthly budget',
                      style: AppTheme().subHeadingBold(size: 14),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: AppTheme().textBoxDecoration('₹0.0'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.border, width: 0.3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:AppTheme.cardBackground,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.attach_money_outlined,
                            color: AppTheme.brown,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Balances',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Expense updates the balance automatically',
                              style: AppTheme().subHeading(size: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: AppTheme.border),
                    SizedBox(height: 20),
                    Text(
                      'Cash',
                      style: AppTheme().subHeadingBold(size: 14),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: AppTheme().textBoxDecoration('₹0.0'),
                    ),
                     SizedBox(height: 20),
                    Text(
                      'gpay',
                      style: AppTheme().subHeadingBold(size: 14),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: AppTheme().textBoxDecoration('₹0.0'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
               AnimatedButton(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),

                      decoration: BoxDecoration(
                        color: AppTheme.orange,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
