/// Returns the two-digit enrollment year encoded in a student ID.
///
/// Numeric IDs encode it at positions 2–3, while IDs with a letter prefix
/// encode it immediately after that prefix.
int? enrollmentYearFromStudentId(String studentId) {
  final letterPrefixYear = RegExp(r'^[A-Za-z]+(\d{2})').firstMatch(studentId);
  final yearDigits = letterPrefixYear?.group(1) ??
      (studentId.length >= 3 ? studentId.substring(1, 3) : '');
  return int.tryParse(yearDigits);
}
