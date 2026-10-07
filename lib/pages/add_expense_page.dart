import 'dart:ffi';

import 'package:finman_app/theme/app_theme.dart';
import 'package:finman_app/utils/animations.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  List<String> expenseCategory = [
    'Laundry',
    'Food',
    'Snacks',
    'Academics',
    'Transport',
    'Health Care',
  ];
  bool isEssential = false;
  bool isCash = true;
  String? selectedCategory;
  final _formKey = GlobalKey<FormState>();
  TextEditingController amount = TextEditingController(text: '0.00');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Keep your records current',
                          style: AppTheme().subHeading(),
                        ),
                        Text(
                          'Add expesnse',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close_rounded,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black87, width: 0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text('Amount', style: AppTheme().subHeading()),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('₹', style: AppTheme().subHeading(size: 40)),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == '0.00') {
                                      print(value);
                                      if (double.tryParse(value!)==null) {
                                        return 'Enter proper amount';
                                        
                                      }
                                  return 'Enter the amount';
                                } else {
                                  return null;
                                }
                              },
                              controller: amount,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Text(
                        'Expense note',
                        style: AppTheme().subHeadingBold(size: 14),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter the amount';
                          } else {
                            return null;
                          }
                        },
                        decoration: AppTheme().textBoxDecoration(
                          'e.g. Laundry',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Category',
                        style: AppTheme().subHeadingBold(size: 14),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Select Category';
                          } else {
                            return null;
                          }
                        },
                        items: expenseCategory
                            .map(
                              (w) => DropdownMenuItem(value: w, child: Text(w)),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => selectedCategory = v),
                        decoration: AppTheme().textBoxDecoration(
                          'Expense type',
                        ),
                      ),

                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: AnimatedButton(
                              onTap: () {
                                setState(() {
                                  isEssential = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),

                                decoration: BoxDecoration(
                                  color: isEssential
                                      ? AppTheme.orange
                                      : AppTheme.lightestOrange,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppTheme.border),
                                ),
                                margin: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    'Essential',
                                    style: TextStyle(
                                      color: isEssential
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: AnimatedButton(
                              onTap: () {
                                setState(() {
                                  isEssential = false;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),

                                decoration: BoxDecoration(
                                  color: !isEssential
                                      ? AppTheme.orange
                                      : AppTheme.lightestOrange,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppTheme.border),
                                ),
                                child: Center(
                                  child: Text(
                                    'Avoidable',
                                    style: TextStyle(
                                      color: !isEssential
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: AnimatedButton(
                              onTap: () {
                                setState(() {
                                  isCash = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),

                                decoration: BoxDecoration(
                                  color: isCash
                                      ? AppTheme.orange
                                      : AppTheme.lightestOrange,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppTheme.border),
                                ),
                                margin: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                      color: isCash
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: AnimatedButton(
                              onTap: () {
                                setState(() {
                                  isCash = false;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),

                                decoration: BoxDecoration(
                                  color: !isCash
                                      ? AppTheme.orange
                                      : AppTheme.lightestOrange,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppTheme.border),
                                ),
                                child: Center(
                                  child: Text(
                                    'Gpay',
                                    style: TextStyle(
                                      color: !isCash
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      AnimatedButton(
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
