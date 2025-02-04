import 'package:flutter/material.dart';
import 'package:fuze/app/viewmodels/welcome/welcome_view_model.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WelcomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Spotify Login")),
      body: Center(
        child: viewModel.token == null
            ? ElevatedButton(
                onPressed: () => viewModel.login(),
                child: Text("Login com Spotify"),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  viewModel.user?.profileImage != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(viewModel.user!.profileImage!),
                          radius: 40,
                        )
                      : Icon(Icons.account_circle, size: 80),
                  SizedBox(height: 10),
                  Text("Nome: ${viewModel.user?.name ?? 'N/A'}"),
                  Text("Email: ${viewModel.user?.email ?? 'N/A'}"),
                ],
              ),
      ),
    );
  }
}
