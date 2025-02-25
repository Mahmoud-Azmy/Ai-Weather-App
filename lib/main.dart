import 'package:ai_weather_app/ai_weather_app.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/app_router.dart';
import 'package:ai_weather_app/core/utils/my_bloc_observer.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  Bloc.observer = MyBlocObserver();
  final token = sl<SharedPreferences>().getString(AppConsts.kToken);
  final initialRoute = token != null && token.isNotEmpty
      ? AppRouter.getLocation
      : AppRouter.onBoarding;
  runApp(
    AiWeatherApp(
      initialRoute: initialRoute,
    ),
  );
}

// class TestApp extends StatelessWidget {
//   const TestApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: AppConsts.appName,
//       home: MyHomePage(title: 'Test'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Define the method to get the prediction
//   Future<void> getPrediction(List<int> features) async {
//     // final url = Uri.parse('http://10.0.2.2:5001/predict');
//     final url = Uri.parse('http://192.168.0.170:5001/predict');

//     // Create the POST request body
//     Map<String, dynamic> body = {'features': features};

//     // Send the POST request
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(body),
//     );

//     // Handle the response
//     if (response.statusCode == 200) {
//       final prediction = json.decode(response.body)['prediction'];
//       if (kDebugMode) {
//         print('=================Prediction: $prediction');
//       }
//     } else {
//       if (kDebugMode) {
//         print('Failed to get prediction');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   print('======================================Pressed');
//                   //- outlook is rainy (the value is 0 for no and 1 for yes)
//                   // - outlook is sunny (the value is 0 for no and 1 for yes)
//                   // - temperature is hot (the value is 0 for no and 1 for yes)
//                   // - temperature is mild (the value is 0 for no and 1 for yes)
//                   // - humidity is normal (the value is 0 for no and 1 for yes)
//                   List<int> features_0 = [0, 1, 1, 0, 0]; // Prediction: [0]
//                   List<int> features_1 = [0, 1, 0, 1, 1]; // Prediction: [1]
//                   getPrediction(
//                       features_0); // Call getPrediction with the feature list
//                 },
//                 icon: const Icon(
//                   Icons.get_app_sharp,
//                   size: 50,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
