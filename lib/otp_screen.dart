import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_app/Dashboard.dart';

class OtpScreen extends StatefulWidget{

  final instance;
  final String phoneVal;
 OtpScreen({super.key, required this.instance, required this.phoneVal});


  static OutlineInputBorder outBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.teal, width: 2));

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {


  TextEditingController otpController = TextEditingController();

  String otpVal='';

  //String OTP='';
  String msg='Hello';

  SnackBar snackBar=SnackBar(content: Text('Please enter valid OTP'));

late String verificationId;



  void initState(){

    print(widget.phoneVal);
    sendOTP(widget.phoneVal);
    super.initState();
  }

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
            Container(
                child: Text("OTP sent to "+widget.phoneVal+" successfully."),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.amber,
                    blurRadius:10,
                    offset: Offset(2.0,5.0)
                  )
                  ]
              ),
            ),
           SizedBox(height: 20),
           Text("Enter OTP"),
           SizedBox(height: 20),
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
               onChanged: (value){otpVal=value;}),
            SizedBox(height: 20),
            Container(
                child: TextButton(
                  onPressed: () async{

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpVal);

        // Sign the user in (or link) with the credential
       var userObj= await FirebaseAuth.instance.signInWithCredential(credential);
       if(userObj.user!=null){
        print("User Verified");
        Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=>Dashboard()));}
       else{
         print("User not Verified");
       }



                    // await instance.verifyPhoneNumber(
                    //   verificationCompleted: (PhoneAuthCredential credential) {print("Successfully Verified");},
                    //   verificationFailed: (FirebaseAuthException e) {},
                    //   codeAutoRetrievalTimeout: (String verificationId) {},
                    //   phoneNumber: "+91$phoneVal",
                    //   codeSent: (String verificationId, int? resendToken) async {
                    //     // Update the UI - wait for the user to enter the SMS code
                    //     String smsCode = otpVal;
                    //
                    //     // Create a PhoneAuthCredential with the code
                    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpVal);
                    //
                    //     // Sign the user in (or link) with the credential
                    //     await instance.signInWithCredential(credential);
                    //   },
                    // );


                    // otpVal=otpController.text;
                    // if(otpVal.length!=6){
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   //print("Please enter a valid OTP");
                    // }
                    //
                    // if(otpVal=="123456"){
                    //   print("Verified");}
                    // else{
                    // print("Not Verified");}

                  },
                  child: const Text('Verify OTP'),
                ) )
          ],
        ),
      ),
    );

  }
  void sendOTP(String phoneVal)async{
    await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: '+91$phoneVal',
            verificationCompleted: (PhoneAuthCredential credential) {print("Verification done");},
            verificationFailed: (FirebaseAuthException e) {},
            codeSent: (String verificationId, int? resendToken) {
              this.verificationId=verificationId;
            },

            codeAutoRetrievalTimeout: (String verificationId) {}
          );
  }
}