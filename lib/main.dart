import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      home: MyHomePage(),
    );
  }
}

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
      borderRadius: new BorderRadius.circular(10.0),
      gradient: gradient, boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

mainAlbumImage() {
  return Container(
    width: double.infinity,
    height: 600,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      image: DecorationImage(
        image:
            AssetImage("assets/smart-home-banner-2.jpeg"),
        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.0), BlendMode.luminosity),
        fit: BoxFit.cover,
      ),
    ),
    padding: EdgeInsets.only(
      left: 30,
      top: 150,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset("assets/logo.png"), 
        SizedBox(height: 10.0),
        Text('MY SMART',
        style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
        Text('HOME',
        style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    ),
  );
}

loginSection() {
  return Container(
    width: double.infinity,
    height: 360,
    decoration: new BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300],
          blurRadius: 5.0,    // soften the shadow
          spreadRadius: 0.0,  //extend the shadow
          offset: Offset(
            0,                // Move to right 10  horizontally
            10.0,             // Move to bottom 10 Vertically
          ),
        )
      ],
    ),
    margin: EdgeInsets.only(
      top: 320,
      left: 25,
      right: 25,
    ),
    padding: EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Text('Welcome Home!',
        style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0,
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Text('Manage your home device and accessories',
        style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.blueAccent,
              fontSize: 15.0,
            ),
          ),
        ),
        SizedBox(height: 5.0),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 5.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password', focusColor: Colors.blue),
        ),
        SizedBox(height: 25.0),
        RaisedGradientButton(
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          gradient: LinearGradient(
            colors: <Color>[Colors.blueAccent, Colors.purple],
          ),
          onPressed: (){
            print('button clicked');
          }
        ),
        SizedBox(height: 10.0),
        Text('Dont have an account yet?',
        style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0,
            ),
          ),
        ),
        FlatButton(
          child: Text('SIGNUP',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 14.0,
              ),
            ),
          ), onPressed: () {},
        ),
      ],
    ),
  );
}

registerSection() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(
      bottom: 30,
    ),
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('REGISTER WITH',
        style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.blue[900])
              ),
              color: Colors.blue[900],
              child: Text(
                'Facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
              onPressed: (){
                print('FaceBook clicked');
              }
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.grey[300])
              ),
              color: Colors.grey[300],
              child: Text(
                'Google',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              onPressed: (){
                print('Google clicked');
              }
            ),
          ],
        ),
      ],
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          mainAlbumImage(),
          loginSection(),
          registerSection(),
        ],
      ),
    );
  }
}
