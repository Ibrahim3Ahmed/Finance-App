import 'package:flutter/material.dart';
import 'package:new_learn/core/styling/app_styles.dart';
import 'package:new_learn/core/widgets/credit_card_widget.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,

          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text("All Cards",style:AppStyles.black18boldStyles.copyWith(
                          fontSize: 18,color: Colors.black
        
            ),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.black),
                  onPressed: () {
                    // Do something
                  },
                ),
              ),
            ),
          ],
        ),
      ),
       body: ListView(
        children: const [
          CreditCardWidget(
            balance: "23400",
            lastFourDigits: "3434",
            expiryDate: "12/24",
            color: Color(0xFF5B61F4),
          ),
          CreditCardWidget(
            balance: "3209",
            lastFourDigits: "4545",
            expiryDate: "12/24",
            color: Color(0xFF4151A6),
          ),
        ],
      ),
    );
  }
}

