import 'package:automation_testing_module/utils/validator.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
//  GlobalKey<FormState> _userLoginFormKey = GlobalKey();
  GlobalKey<FormState> _userLoginFormKey = GlobalKey();
  TextEditingController _emailIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool validDataFilled = false;

  bool _autoValidate= false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LOGIN'),
          backgroundColor: Colors.greenAccent,
        ),
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: SingleChildScrollView(
              child: Form(
                key: _userLoginFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              key: Key('emailKey'),
                              autovalidate: _autoValidate,
                              controller: _emailIdController,
                              validator: (value) =>
                                  Validator.validateEmail(value.trim()),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                labelText: 'Email Address*',
                                labelStyle:
                                    TextStyle(color: Colors.blueGrey),
                              ),
                              cursorColor: Colors.blueGrey,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              key: Key('passwordKey'),
                              obscureText: true,
                              autovalidate: _autoValidate,
                              controller: _passwordController,
                              validator: (value) =>
                                  Validator.validatePassword(
                                      value.trim()),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                labelText: 'Password*',
                                labelStyle:
                                    TextStyle(color: Colors.blueGrey),
                              ),
                              cursorColor: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          Center(
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              onPressed: () => onButtonPressed(context),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              color: Colors.blueGrey,
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(
                              validDataFilled ? 'Valid Data' : '', style: TextStyle(
                              fontSize: 18, ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onButtonPressed(BuildContext context) {
    setState(() {
      _autoValidate= true;
    });
    if (_userLoginFormKey.currentState.validate()) {
      setState(() {
        validDataFilled = !validDataFilled;
      });
    }
  }
}
