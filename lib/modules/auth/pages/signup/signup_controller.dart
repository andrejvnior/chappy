import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projects/core/extensions.dart';
import 'package:projects/models/firebase_model.dart';

part 'signup_controller.g.dart';

class SignUpController = SignUpControllerBase with _$SignUpController;

abstract class SignUpControllerBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;

  @observable
  String errorMessage = '';

  @action
  setErrorMessage() => errorMessage = 'Please, insert mandatory fields.';

  @observable
  bool isLoading = false;

  @action
  void setLoading() => isLoading = !isLoading;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @action
  void setEmail(String v) => email = v;

  @action
  void setPassword(String v) => password = v;

  @action
  void setConfirmPassword(String v) => confirmPassword = v;

  @computed
  bool get emailValid => email.isNotEmpty && email.isEmail;

  // String? get emailError {
  //   if (emailValid) {
  //     return null;
  //   } else {
  //     if (email.isEmpty) {
  //       return 'E-mail should not be empty.';
  //     } else if (!email.isEmail) {
  //       return 'Please, insert a correct email.';
  //     }
  //   }
  // }

  @computed
  bool get passwordValid => password.length > 6;

  @computed
  bool get confirmPasswordValid => confirmPassword == password;

  Future<SaveResult> signUp() async {
    print('Signing up...');
    try {
      print('Trying to sign up... $email');
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return SaveResult.success;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    print('Sign up failed...');
    return SaveResult.failed;
  }

  @computed
  bool get isValid => emailValid && passwordValid && confirmPasswordValid;
}
