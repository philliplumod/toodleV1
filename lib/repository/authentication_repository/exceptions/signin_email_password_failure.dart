class SignInWithEmailAndPasswordFailure implements Exception {
  final String message;

  const SignInWithEmailAndPasswordFailure([this.message = "Something went wrong"]);

  factory SignInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignInWithEmailAndPasswordFailure('Please enter a valid email address.');
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure('The user corresponding to the given email has been disabled.');
      case 'user-not-found':
        return const SignInWithEmailAndPasswordFailure('No user corresponding to the given email address.');
      case 'wrong-password':
        return const SignInWithEmailAndPasswordFailure('Incorrect password.');
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }
}
