class NumberToWordConverter {
  String wordify(int number) {
    int i = 0;
    String result = '';

    if (number == 0) {
      return 'zero';
    }

    // Loop through the number in groups of three digits
    while (number > 0) {
      // Get the hundreds digit and the tens and ones digit
      if (number % 1000 != 0) {
        final int hundreds = number % 1000 ~/ 100;
        final int tensAndOnes = number % 100;

        String word = '';

        // Add the word for the hundreds digit if it's not zero
        if (hundreds != 0) {
          final String digitWord = _mapDigitToOnes(hundreds);

          word += '$digitWord hundred';

          if (tensAndOnes != 0) {
            word += ' ';
          }
        }

        // Deal with the tens/teens exception
        if (tensAndOnes < 10) {
          final String digitWord = _mapDigitToOnes(tensAndOnes);

          word += digitWord;
        } else if (tensAndOnes < 20) {
          final String digitWord = _mapDigitToTeens(tensAndOnes - 10);

          word += digitWord;
        } else {
          final int tensDigit = tensAndOnes ~/ 10;
          final int onesDigit = tensAndOnes % 10;
          final String digitWord = _mapDigitToTens(tensDigit);

          word += digitWord;

          if (onesDigit != 0) {
            final String digitWord = _mapDigitToOnes(onesDigit);

            word += '-$digitWord';
          }
        }

        if (i != 0) {
          final String digitWord = _mapDigitToThousands(i);

          word += ' $digitWord';
        }

        if (result.isNotEmpty) {
          result = '$word, $result';
        } else {
          result = word;
        }
      }

      // Move on to the next group of three digits
      number ~/= 1000;
      i++;
    }

    return result;
  }

  String _mapDigitToOnes(int digit) {
    return switch (digit) {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      _ => '',
    };
  }

  String _mapDigitToTens(int digit) {
    return switch (digit) {
      2 => 'twenty',
      3 => 'thirty',
      4 => 'forty',
      5 => 'fifty',
      6 => 'sixty',
      7 => 'seventy',
      8 => 'eighty',
      9 => 'ninety',
      _ => '',
    };
  }

  String _mapDigitToTeens(int digit) {
    return switch (digit) {
      0 => 'ten',
      1 => 'eleven',
      2 => 'twelve',
      3 => 'thirteen',
      4 => 'fourteen',
      5 => 'fifteen',
      6 => 'sixteen',
      7 => 'seventeen',
      8 => 'eighteen',
      9 => 'nineteen',
      _ => '',
    };
  }

  String _mapDigitToThousands(int digit) {
    return switch (digit) {
      0 => '',
      1 => 'thousand',
      2 => 'million',
      3 => 'billion',
      4 => 'trillion',
      _ => '',
    };
  }
}
