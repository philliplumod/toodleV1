class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "Something went wrong"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a Stronger password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a valid email address.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'Email address already in use.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Signing in with Email and Password is not enabled.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'The user corresponding to the given email has been disabled.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
