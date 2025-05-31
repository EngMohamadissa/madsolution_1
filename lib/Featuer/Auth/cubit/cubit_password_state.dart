// import 'package:flutter/material.dart';

// class PasswordVisibilityState {
//   final bool obscureText;
//   final IconData icon;

//   const PasswordVisibilityState({
//     this.obscureText = true,
//     this.icon = Icons.visibility_off,
//   });

//   PasswordVisibilityState copyWith({
//     bool? obscureText,
//     IconData? icon,
//   }) {
//     return PasswordVisibilityState(
//       obscureText: obscureText ?? this.obscureText,
//       icon: icon ?? this.icon,
//     );
//   }
// }

import 'package:flutter/material.dart';

abstract class PasswordVisibilityState {
  final bool obscureText;
  final IconData icon;

  const PasswordVisibilityState(this.obscureText, this.icon);
}

class PasswordObscured extends PasswordVisibilityState {
  const PasswordObscured() : super(true, Icons.visibility_off);
}

class PasswordVisible extends PasswordVisibilityState {
  const PasswordVisible() : super(false, Icons.visibility);
}
