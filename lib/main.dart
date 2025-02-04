import 'package:flutter/material.dart';
import 'package:fuze/app/app_widget.dart';
import 'package:fuze/app/viewmodels/welcome/welcome_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WelcomeViewModel(),
        ),
      ],
      child: const AppWidget(),
    ),
  );
}
