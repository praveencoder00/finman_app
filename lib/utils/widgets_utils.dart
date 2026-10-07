import 'package:finman_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class WidgetsUtils {
  Widget expenseRecord(String title, int amount, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfff6ead3),
                ),
                child: SvgPicture.asset(
                  type == 'Mandatory'
                      ? 'assets/icons/mandatory.svg'
                      : 'assets/icons/optional.svg',
                  color: AppTheme.brown,
                  height: 18,
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('2:20 pm', style: TextStyle(color: AppTheme.grey)),
                ],
              ),

              Spacer(),
              Column(
                children: [
                  Text(
                    '₹$amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    height: 25,
                    decoration: BoxDecoration(
                      color: type == 'Mandatory'
                          ? const Color.fromARGB(83, 76, 175, 79)
                          : const Color.fromARGB(82, 244, 67, 54),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        type,
                        style: TextStyle(
                          color: type == 'Mandatory'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(color: Color(0xfff6ead3)),
        ],
      ),
    );
  }

  Widget overviewContainer(
    String heading,
    String amount,
    String icon,
    String footer, {
    Color backColor = Colors.white,
    Color borderColor = AppTheme.grey,
  }) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color:borderColor, width: 0.2),
          borderRadius: BorderRadius.circular(10),
          color:backColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(heading, style: AppTheme().subHeadingBold()),
                Spacer(),
                SvgPicture.asset(
                  icon,
                  color: AppTheme.grey,
                ),
              ],
            ),

            Text(
              amount,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(footer, style: AppTheme().subHeading()),
          ],
        ),
      ),
    );
  }
}


/*





 



 */