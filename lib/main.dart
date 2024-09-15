import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:necadmin/assign_users/assignbloc/assign_bloc.dart';
import 'package:necadmin/assign_users/bloc/classroom_bloc.dart';
import 'package:necadmin/assign_users/getallclass/getall_bloc.dart';
import 'package:necadmin/landing_page/landiing_bloc/landing_page_bloc.dart';
import 'package:necadmin/landing_page/ui/landing_page.dart';
import 'package:necadmin/manageUser/adduserbloc/manageuser_bloc.dart';
import 'package:necadmin/manageUser/listusersbloc/listuser_bloc.dart';
import 'package:necadmin/models/ModelProvider.dart';

import 'amplify_outputs.dart';

Future<void> _configureAmplify() async {
  try {
   final auth = AmplifyAuthCognito();
    final api = AmplifyAPI(
      options: APIPluginOptions(
        modelProvider: ModelProvider.instance
        )
      );
    await Amplify.addPlugins([auth, api]);
    await Amplify.configure(amplifyConfig);
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LandingPageBloc(),
        ),
         BlocProvider(
          create: (context) => ManageuserBloc(),
        ),
        BlocProvider(
          create: (context) => ListuserBloc(),
        ),
        BlocProvider(
          create: (context) => AssignBloc(),
        ),
        BlocProvider(
          create: (context) => GetallBloc(),
        ),
        BlocProvider(
          create: (context) => ClassroomBloc(),
        ),

      ],
      child: const MyApp(),
    ));
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.nunitoTextTheme(),
          ),
        builder: Authenticator.builder(),
        home: const LandingPage()
      ),
    );
  }
}