enum BulletStyle {
  /// Disable bullet styling
  none,

  /// An asterisk
  ///
  /// `*`
  asterisk,

  /// <i class="material-icons-round md-36">check_box_outline_blank</i> &#x2014; An outlined square.
  checkbox,

  /// An empty circle.
  disc,

  /// <i class="material-icons-round md-36">circle</i> &#x2014; A filled circle.
  discFill,

  /// A hypen or dash
  ///
  /// `-`
  dash,

  /// Lowercased alphabets of the form
  ///
  /// `a.`
  ///
  /// `b.`
  ///
  /// `c.`
  alphabets,

  /// Lowercased alphabets of the form
  ///
  /// `(a)`
  ///
  /// `(b)`
  ///
  /// `(c)`
  alphabetsBracketed,

  /// Lowercased alphabets of the form
  ///
  /// `a)`
  ///
  /// `b)`
  ///
  /// `c)`
  alphabetsRightBracketed,

  /// Numbers of the form
  ///
  /// `1.`
  ///
  /// `2.`
  ///
  /// `3.`
  numeric,

  /// Numbers of the form
  ///
  /// `(1)`
  ///
  /// `(2)`
  ///
  /// `(3)`
  numericBracketed,

  /// Numbers of the form
  ///
  /// `1)`
  ///
  /// `2)`
  ///
  /// `3)`
  numericRightBracketed,

  /// Roman numerals of the form
  ///
  /// `i.`
  ///
  /// `ii.`
  ///
  /// `iii.`
  romanNumerals,

  /// Roman numerals of the form
  ///
  /// `(i)`
  ///
  /// `(ii)`
  ///
  /// `(iii)`
  romanNumeralsBracketed,

  /// Roman numerals of the form
  ///
  /// `i)`
  ///
  /// `ii)`
  ///
  /// `iii)`
  romanNumeralsRightBracketed,
}
