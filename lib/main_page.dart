import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'notificationservice.dart';


class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool check_ontap = false;

  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }






  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(200, 200, 200, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
                child: Column(
                  children: [


                    Text(
                      'koko nen ne',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 34,
                        fontFamily: 'Baby',
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: height * 0.43,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: size.height * 0.3,
                                  width: size.width * 0.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 80,
                                      ),
                                      Text(
                                        'Baby name',
                                        style: TextStyle(
                                          color: Color.fromRGBO(39, 105, 171, 1),
                                          fontFamily: 'Nunito',
                                          fontSize: 37,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("아기가 잘 자고있어요", style: TextStyle(
                                          fontSize: 17, fontFamily: "Baby"),)
                                    ],
                                  ),
                                ),
                              ),
                              check_ontap?Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                              child: Container(
                              child: Image.asset(
                              'assets/images/crying.png',
                              width: innerWidth * 0.45,
                              fit: BoxFit.fitWidth,
                              ),
                              ),
                              ),
                              ):Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/mainimg.png',
                                      width: innerWidth * 0.45,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    RaisedButton(
                      onPressed:(){
                        setState(() {
                          check_ontap = !check_ontap;
                        });
                        NotificationService().showNotification(1, "위험!", "아기가 위험해요!", 1);
                      },
                      child: Text('Show Notification'),
                    ),


                  ],
                ),
            ),
          ),
        )
      ],
    );
  }


}