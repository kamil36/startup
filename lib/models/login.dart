  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // TextEditingController _phoneNumberController = TextEditingController();
  // TextEditingController _otpController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();

  // String verificationId = '';

  // Future<void> verifyPhone() async {
  //   final PhoneVerificationCompleted verified = (AuthCredential authResult) {
  //     _auth.signInWithCredential(authResult);
  //   };

  //   final PhoneVerificationFailed verificationFailed =
  //       (FirebaseAuthException authException) {
  //     print('Error: ${authException.message}');
  //   };

  //   final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
  //     this.verificationId = verId;
  //   };

  //   final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
  //     this.verificationId = verId;
  //   };

  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: _phoneNumberController.text,
  //     verificationCompleted: verified,
  //     verificationFailed: verificationFailed,
  //     codeSent: smsSent,
  //     codeAutoRetrievalTimeout: autoTimeout,
  //   );
  // }

  // Future<void> signInWithOTP() async {
  //   AuthCredential authCredential = PhoneAuthProvider.credential(
  //     verificationId: verificationId,
  //     smsCode: _otpController.text,
  //   );

  //   UserCredential authResult = await _auth.signInWithCredential(authCredential);
  //   User? user = authResult.user;

  //   // Store user data in Firestore
  //   await _firestore.collection('users').doc(user!.uid).set({
  //     'phone': user.phoneNumber,
  //     // You can add more user details here
  //   });

  //   // Navigate to the home screen or perform any other actions after successful authentication
  //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  // }

  // Future<void> signInWithEmailAndPassword() async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: _phoneNumberController.text, // Using email as a placeholder for phone number
  //       password: _passwordController.text,
  //     );

  //     User? user = userCredential.user;

  //     // Navigate to the home screen or perform any other actions after successful authentication
  //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }