class Strings {
  // App/Page titles
  static const appTitle = 'Flutter Technical Test Lev. 1';
  static const widgetTestPageTitle = 'Widget Test Page';
  static const logicTestPageTitle = 'Logic Test Page';

  // Form field titles
  static const usernameFormFieldTitle = 'Username';

  // Action strings
  static const submit = 'Submit';

  // Logic Test Page strings
  static const logicTestPageHeader =
      'Please enter an integer number in the "Input" box and tap on "Convert" '
      'to see the equivalent in words appear in the "Output" box.';
  static const logicTestPageInputTitle = 'Input';
  static const logicTestPageOutputTitle = 'Output';
  static const logicTestPageConvert = 'Convert';

  // Error messages
  static const invalidInputErrorMessage = 'INVALID INPUT';
  static const inputMustBeNumericErrorMessage = 'Input must be numeric';
  static const inputMustNotBeEmptyErrorMessage = 'Input must not be empty';

  static String outOfBoundsErrorMessage(int min, int max) {
    return 'Input must be between $min and $max';
  }
}
