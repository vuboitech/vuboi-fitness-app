import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wear_os_connectivity/flutter_wear_os_connectivity.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    getDevice();

    super.initState();
  }

  void getDevice() async {
    FlutterWearOsConnectivity _flutterWearOsConnectivity = FlutterWearOsConnectivity();
    _flutterWearOsConnectivity.configureWearableAPI();

    List<WearOsDevice> _connectedDevices = await _flutterWearOsConnectivity.getConnectedDevices();
    _connectedDevices.length;

    _flutterWearOsConnectivity.messageReceived().listen((message) {
      print(message.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    const platform = MethodChannel('flutter.native/helper');

    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          String random;
          try {
            random = await platform.invokeMethod('getRandomNumber');
          } on PlatformException catch (e) {
            debugPrint(e.toString());
            random = "";
          }

          print(random);
        },
        onDoubleTap: () async {
          int heartRate;
          try {
            heartRate = await platform.invokeMethod('getHeartRate');
          } on PlatformException catch (e) {
            debugPrint(e.toString());
            heartRate = 0;
          }

          print(heartRate);
        },
        child: Center(child: Text("Assalamu'alaikum World"))),
    );
  }
}
