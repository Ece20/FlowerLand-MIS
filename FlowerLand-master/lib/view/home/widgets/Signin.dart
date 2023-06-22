import 'package:flower_shop/view/home/widgets/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flower_shop/view/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';


class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Page: ${appState.currentPage}'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'FlowerLand',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontStyle: FontStyle.italic
              ),
            ),
            // Text(
            //   'If you don\'t have an account, register here',
            //   style: TextStyle(
            //     fontSize: 12,
            //     color: Colors.blue,
            //     fontStyle: FontStyle.italic,
            //   ),
            // ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
                Provider.of<AppState>(context, listen: false).updateCurrentPage('/HomePage');
                child: const Text('Go to Category');
                },
              child: Text('Login'),
            ),
            SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
                Provider.of<AppState>(context, listen: false).updateCurrentPage('/Register');
              },
              child: Text('Click here to register'),
            ),
          ],
        ),
      ),
    );
  }
}
