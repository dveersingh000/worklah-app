import 'package:flutter/material.dart';
import 'package:work_lah/screens/bottombar/profile/cashout/CashOutSuccessScreen.dart';

class SelectBankScreen extends StatefulWidget {
  const SelectBankScreen({super.key});

  @override
  _SelectBankScreenState createState() => _SelectBankScreenState();
}

class _SelectBankScreenState extends State<SelectBankScreen> {
  String selectedMethod = "PayNow via Mobile";
  String selectedBank = "DBS";
  bool saveForFuture = false;
  double cashOutAmount = 100.00; // Example amount

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose transfer method",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildPayNowOption("PayNow via Mobile", "Linked", "assets/images/paynow_logo.png"),
              _buildPayNowOption("PayNow via NRIC", "Link", "assets/images/paynow_logo.png"),
              Divider(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.add_circle_outline, color: Colors.blue),
                    SizedBox(width: 5),
                    Text("Add another bank", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text("Select Bank Name *", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: selectedBank,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
                items: [
                  _buildBankDropdownItem("DBS", "assets/images/bank_logo.png"),
                  _buildBankDropdownItem("UOB", "assets/images/bank_logo.png"),
                  _buildBankDropdownItem("OCBC", "assets/images/bank_logo.png"),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedBank = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              Text("Bank Account Number *", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: "XXXX XXXX 3456",
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: saveForFuture,
                    onChanged: (value) {
                      setState(() {
                        saveForFuture = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text("Save these details for future cashouts", style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Colors.orange),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "Worklah! is not liable for inaccurate info for payment details that being input and transferred.",
                      style: TextStyle(color: Colors.orange, fontSize: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CashOutConfirmationScreen(
                        amount: cashOutAmount,
                        bankName: selectedBank,
                        accountNumber: "XXXX XXXX 3456",
                      ),
                    ),
                  );
                },
                child: Text("Proceed", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // PayNow selection UI
  Widget _buildPayNowOption(String title, String status, String logoPath) {
    return ListTile(
      leading: Radio(
        value: title,
        groupValue: selectedMethod,
        onChanged: (value) {
          setState(() {
            selectedMethod = value.toString();
          });
        },
      ),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            status,
            style: TextStyle(color: status == "Linked" ? Colors.green : Colors.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          Image.asset(logoPath, height: 18), // Ensure the correct path
        ],
      ),
    );
  }

  // Bank selection UI with logo
  DropdownMenuItem<String> _buildBankDropdownItem(String bankName, String logoPath) {
    return DropdownMenuItem(
      value: bankName,
      child: Row(
        children: [
          Image.asset(logoPath, height: 20),
          SizedBox(width: 8),
          Text(bankName),
        ],
      ),
    );
  }
}