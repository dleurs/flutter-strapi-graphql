import 'package:flutter/material.dart';

import 'package:frontend/src/app.dart';
import 'package:frontend/src/models/authentication/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(), child: App()),
  );
}
