import 'package:flutter/material.dart';
import 'package:work_lah/screens/bottombar/profile/cashout/SelectBankScreen.dart';

class CashOutHomeScreen extends StatefulWidget {
  const CashOutHomeScreen({super.key});

  @override
  _CashOutHomeScreenState createState() => _CashOutHomeScreenState();
}

class _CashOutHomeScreenState extends State<CashOutHomeScreen> {
  TextEditingController amountController = TextEditingController();
  double availableBalance = 4553.00;
  String selectedMethod = "PayNow via Mobile";
  bool isAmountEntered = false;

  void updateAmount(String value) {
    setState(() {
      isAmountEntered =
          value.isNotEmpty && double.tryParse(value) != null && double.parse(value) > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen width
    double screenHeight = MediaQuery.of(context).size.height; // Get screen height
    bool isSmallScreen = screenWidth < 360; // Check for small screens like 320px

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Cash Out",
          style: TextStyle(
            fontSize: isSmallScreen ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(Icons.notifications_outlined, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),

              // Title
              Text(
                "Enter amount to cash out",
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: screenHeight * 0.06),

              // Amount Input with "$" symbol
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "\$",
                          style: TextStyle(fontSize: screenWidth * 0.12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        SizedBox(
                          width: screenWidth * 0.35,
                          child: TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: screenWidth * 0.12, fontWeight: FontWeight.bold),
                            onChanged: updateAmount,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "0",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        minimumSize: Size(screenWidth * 0.4, 30),
                      ),
                      child: Text(
                        "Add note",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isSmallScreen ? 12 : 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.06),

              // Available Balance
              Row(
                children: [
                  Icon(Icons.account_balance_wallet_outlined, color: Colors.black, size: isSmallScreen ? 18 : 22),
                  SizedBox(width: 5),
                  Text(
                    "Available balance: ",
                    style: TextStyle(fontSize: isSmallScreen ? 12 : 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "\$$availableBalance",
                    style: TextStyle(fontSize: isSmallScreen ? 12 : 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.02),

              // Bank Selection Box
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selected bank",
                      style: TextStyle(fontSize: isSmallScreen ? 12 : 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "PayNow via Mobile",
                              groupValue: selectedMethod,
                              onChanged: (value) {
                                setState(() {
                                  selectedMethod = value.toString();
                                });
                              },
                            ),
                            Text(
                              "PayNow via Mobile",
                              style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                            ),
                          ],
                        ),
                        Flexible(  // Wrap to prevent overflow
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Linked",
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis, // Prevents overflow
                                softWrap: false,
                              ),
                              SizedBox(width: 5),
                              Image.asset(
                                'assets/images/paynow_logo.png',
                                height: isSmallScreen ? 15 : 20, // Dynamic logo size
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SelectBankScreen()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Choose another method",
                              style: TextStyle(fontSize: isSmallScreen ? 12 : 14, color: Colors.blue),
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.06),

              // Continue Button
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: isAmountEntered
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelectBankScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAmountEntered ? Colors.blue : Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 12 : 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
