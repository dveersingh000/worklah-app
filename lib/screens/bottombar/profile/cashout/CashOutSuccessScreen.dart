import 'package:flutter/material.dart';
import 'package:work_lah/screens/bottombar/bottom_bar_screen.dart';

class CashOutConfirmationScreen extends StatelessWidget {
  final double amount;
  final String bankName;
  final String accountNumber;

  const CashOutConfirmationScreen({
    super.key,
    required this.amount,
    required this.bankName,
    required this.accountNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cash Option", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Icon(Icons.notifications_outlined, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),

            // Confirmation Icon
            Center(
              child: Icon(
                Icons.check_circle,
                color: Colors.blue,
                size: 100,
              ),
            ),

            SizedBox(height: 20),

            // Amount
            Text(
              "\$${amount.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
            ),

            SizedBox(height: 10),

            // Confirmation Text
            Text(
              "Cash Out Confirmed",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),

            SizedBox(height: 5),

            // Date & Time
            Text(
              "02:00 PM, 02 Nov, 2024",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            SizedBox(height: 50),

            // Bank Information
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Transferred to:", style: TextStyle(fontSize: 14, color: Colors.black54)),
                      SizedBox(height: 5),
                      Text(
                        "Linked bank:",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "**** ${accountNumber.substring(accountNumber.length - 4)}",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/bank_logo.png', // Update with correct bank image path
                    height: 30,
                  ),
                ],
              ),
            ),

            Spacer(),

            // Back to Home Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BottomBarScreen(index: 2)),
                  (route) => false,
                );
              },
              child: Text("Back to Home", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}