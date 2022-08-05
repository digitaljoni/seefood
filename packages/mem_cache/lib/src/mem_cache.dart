/// {@template mem_cache}
/// Store data in the memory using key-value pair
/// {@endtemplate}
class MemCache {
  /// {@macro mem_cache}
  MemCache() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  /// writes the provided [key] and [value] pair to memory cache
  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  /// retrieve value from memory cache for the provided [key]
  /// defaults to `null` if not found
  T? read<T extends Object>({required String key}) {
    final value = _cache[key];

    return (value is T) ? value : null;
  }
}
