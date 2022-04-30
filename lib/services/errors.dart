class Errors {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'emaıl-already-ın-use':
        return "This e-mail address is already in use. Please use a different email";
      case 'wrong-password':
        return "The entered password is incorrect!";
      case 'ınvalıd-emaıl':
        return 'Invalid e-mail address';
      case 'user-not-found':
        return 'No user found for this information!';
      case 'network-request-failed':
        return 'Check your internet connection!';
      case 'email-already-in-use':
        return 'This e-mail address is being used';
      default:
        return "An unknown error has occurred.";
    }
  }
}
