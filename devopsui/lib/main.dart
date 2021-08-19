
import 'package:devopsui/splash_screen.dart';
import 'package:devopsui/utils/docker_output.dart';
import 'package:devopsui/utils/docker_screen.dart';
import 'package:devopsui/utils/home_screen.dart';
import 'package:devopsui/utils/kube_output.dart';
import 'package:devopsui/utils/kube_screen.dart';
import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
   // "/": (BuildContext context) => HomeScreen(),
  "/splash": (BuildContext context) => SplashScreen(),
  "/docker": (BuildContext context) => DockerScreen(),
  "/kubernetes": (BuildContext context) => KubernetesScreen(),
  "/docker_output": (BuildContext context) => DockerOutput(),
  "/kube_output": (BuildContext context) => KubeOutput(),

};


void main() => runApp(MaterialApp(
 theme:
 ThemeData(brightness: Brightness.dark),
   debugShowCheckedModeBanner: false,
    initialRoute: '/splash',
    title: "Devops-ui",
    home: HomeScreen(),
    routes: routes));


