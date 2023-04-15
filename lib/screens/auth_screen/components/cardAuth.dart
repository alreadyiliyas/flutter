import 'package:flutter/material.dart';
import 'package:testtask/screens/home/home_screen.dart';

class cardAuth extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      elevation: 12.0,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email пустой';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 26),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пароль пустой';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      content: SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
                          ),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                  );
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsersScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    minimumSize: const Size(double.infinity, 34),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                child: const Text('Войти', style: TextStyle(fontSize: 17)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
