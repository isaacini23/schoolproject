import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';





class HomeScreen1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Resource Sharing'),
        backgroundColor: Colors.red.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Campus Resource Sharing',
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/login'); // Use GoRouter to navigate
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade900),
              child: Text('Get Started', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}