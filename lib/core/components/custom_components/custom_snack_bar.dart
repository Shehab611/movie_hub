part of 'custom_components.dart';

showCustomSnackBar(String? message, BuildContext context,
    {bool isError = true, bool inTop = false}) {
  Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: inTop ? ToastGravity.TOP : ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:
          isError ? const Color(0xFFFF0014) : const Color(0xFF1E7C15),
      textColor: Colors.white,
      fontSize: 16.0);
}
