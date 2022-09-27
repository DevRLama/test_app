import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget{


  TextEditingController otpController = TextEditingController();
  String otpVal='';
  //String OTP='';
  String msg='Hello';
  SnackBar snackBar=SnackBar(content: Text('Please enter valid OTP'));


  static OutlineInputBorder outBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.teal, width: 2));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Entered OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           PinCodeTextField(
               appContext: context,
               obscureText: true,
               controller: otpController,
               length: 6,
               pinTheme: PinTheme.defaults(
                 shape: PinCodeFieldShape.box,
                 borderRadius: BorderRadius.circular(8)
               ),
               keyboardType: TextInputType.number,
               onChanged: (value){print(value);}),
            SizedBox(height: 20),
            Container(
                child: TextButton(
                  onPressed: () {
                    otpVal=otpController.text;
                    if(otpVal.length!=6){
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //print("Please enter a valid OTP");
                    }

                    if(otpVal=="123456"){
                      print("Verified");}
                    else{
                    print("Not Verified");}

                  },
                  child: Text('Verify OTP'),
                ))
          ],
        ),
      ),
    );

  }
  
}