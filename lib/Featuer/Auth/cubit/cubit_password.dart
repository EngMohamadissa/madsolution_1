import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freely/Featuer/Auth/cubit/cubit_password_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(const PasswordObscured());

  void toggleVisibility() {
    if (state is PasswordObscured) {
      emit(const PasswordVisible());
    } else {
      emit(const PasswordObscured());
    }
  }
}
