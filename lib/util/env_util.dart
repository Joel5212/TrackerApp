import 'package:flutter_dotenv/flutter_dotenv.dart';

//Next, we read out the environment variables for the current executing environment.
// Therefore we import the DotEnv class from the flutter_dotenv package and load
// the values by passing the path to the .env file.
// To do so, we create a file called env_util.dart and implement the following function:


Future<Map<String, String>> loadEnvFile(String path) async {
  DotEnv instance = DotEnv();
  await instance.load(path);
  return instance.env;
}