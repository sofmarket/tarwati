/// Extracts and validates a UUID from a QR payload (plain id, URL path,
/// or embedded in a longer string).
String? tryParseUuidFromScan(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;

  bool isUuid(String s) {
    return RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
      caseSensitive: false,
    ).hasMatch(s);
  }

  String norm(String s) => s.toLowerCase();

  if (isUuid(trimmed)) return norm(trimmed);

  final uri = Uri.tryParse(trimmed);
  if (uri != null) {
    for (final segment in uri.pathSegments.reversed) {
      if (isUuid(segment)) return norm(segment);
    }
  }

  final embedded = RegExp(
    r'[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}',
    caseSensitive: false,
  );
  final match = embedded.firstMatch(trimmed);
  if (match != null && isUuid(match.group(0)!)) {
    return norm(match.group(0)!);
  }

  return null;
}
