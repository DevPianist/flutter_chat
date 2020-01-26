import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../widgets/circle.dart';
import '../widgets/inputText.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final logo = Image.asset(
      'assets/images/logo.png',
    );

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: _size.width,
          height: _size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -_size.width * 0.15,
                top: -_size.width * 0.35,
                child: CircleOwn(
                  radius: _size.width * 0.45,
                  colors: [
                    Colors.deepOrangeAccent,
                    Colors.orange[800],
                  ],
                ),
              ),
              Positioned(
                left: -_size.width * 0.15,
                top: -_size.width * 0.35,
                child: CircleOwn(
                  radius: _size.width * 0.35,
                  colors: [
                    Colors.grey[600],
                    Colors.grey[300],
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: _size.width,
                  height: _size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: _size.width * 0.7,
                              height: _size.height * 0.16,
                              margin: EdgeInsets.only(top: _size.width * 0.3),
                              decoration: BoxDecoration(
                                // color: Colors.black26,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: logo,
                            ),
                            Text(
                              'Chat',
                              style: TextStyle(
                                  color: Colors.orange[800],
                                  fontSize: 25,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 350,
                                maxWidth: 350,
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    InputTextOwn(
                                      text: 'Correo',
                                      inputType: TextInputType.emailAddress,
                                      validator: (String text) {
                                        if (text.contains('@')) {
                                          return null;
                                        }
                                        return 'Correo Invalido';
                                      },
                                    ),
                                    SizedBox(height: 30),
                                    InputTextOwn(
                                      text: 'Contraseña',
                                      isSecure: true,
                                      validator: (String text) {
                                        if (text.isNotEmpty &&
                                            text.length > 4) {
                                          return null;
                                        }
                                        return 'Contraseña invalida';
                                      },
                                    ),
                                    SizedBox(height: 40),
                                  ],
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 350,
                                maxWidth: 350,
                              ),
                              child: CupertinoButton(
                                borderRadius: BorderRadius.circular(5),
                                padding: EdgeInsets.symmetric(vertical: 15),
                                color: Colors.orange[800],
                                onPressed: () {},
                                child: Text(
                                  'Iniciar Sesion',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'No tienes una cuenta?',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                                CupertinoButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Registrate',
                                    style: TextStyle(
                                        color: Colors.orange[800],
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: _size.height * 0.065,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
