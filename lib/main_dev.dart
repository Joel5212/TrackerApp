import 'package:tracker_app/util/env_util.dart';
import 'package:flutter/material.dart';

import 'app.dart';
void main() async {
  Map<String, String> env = await loadEnvFile("assets/env/.env_dev");
  runApp(MyApp(env["API_URL"]));
}