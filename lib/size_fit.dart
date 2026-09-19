/// Getting a file under a size limit somebody else decided.
///
/// This is not a nicety. Government portals reject anything over a fixed
/// number of kilobytes and say so in a red box with no further help: India's
/// NTA exam portal wants a photo between 10 and 200 KB and a PDF under 300
/// KB, the UAE's ICP takes 2 MB, MOHRE 500 KB and JPEG only, Nepal's passport
/// service 1 MB. People currently scan in one app and then go and find a
/// second app to shrink the result — two of those shrinking apps have ten
/// million installs each and do nothing else.
///
/// The steps below are walked in order until the file fits. Resolution is
/// given up before quality at first, because a page that is slightly smaller
/// still reads perfectly while a page full of JPEG mush does not; only at the
/// bottom, where the alternative is failing, is quality sacrificed hard.
class SizeFit {
  const SizeFit._();

  /// One attempt: how big the longest side may be, at what JPEG quality, and
  /// whether to drop the colour.
  ///
  /// Colour goes before the picture gets small, because a document almost
  /// never needs it and dropping it saves a great deal. People chasing a
  /// portal's limit already do this by hand and say so out loud — "make it
  /// black and white to start with, colours take space" — so it belongs in
  /// the middle of the ladder, not at the bottom.
  static const steps = <(int maxDim, int quality, bool grey)>[
    (3000, 88, false),
    (2400, 82, false),
    (2000, 78, false),
    (2000, 74, true),
    (1700, 72, true),
    (1400, 68, true),
    (1200, 62, true),
    (1000, 55, true),
    (850, 48, true),
    (700, 40, true),
    (560, 32, true),
  ];

  /// Common limits, smallest first. The wording belongs to the UI; these are
  /// just the numbers, and they are the ones real portals ask for.
  static const presets = <int>[
    100 * 1024,
    200 * 1024,
    500 * 1024,
    1024 * 1024,
    2 * 1024 * 1024,
    5 * 1024 * 1024,
  ];

  /// Where to start, given how far over the limit we already are.
  ///
  /// Walking from the top every time means a 12 MP page aiming at 100 KB gets
  /// re-encoded eight times before anything useful happens. Each step is
  /// roughly a third smaller than the one above, so the overshoot tells us
  /// how many steps down to jump. It is deliberately conservative — one step
  /// short rather than one too far, because overshooting costs quality that
  /// cannot be won back.
  static int startFor(int currentBytes, int targetBytes) {
    if (currentBytes <= targetBytes || targetBytes <= 0) return 0;
    final over = currentBytes / targetBytes;
    var i = 0;
    var shrink = 1.0;
    while (i < steps.length - 1 && shrink * 1.6 < over) {
      shrink *= 1.6;
      i++;
    }
    return i > 0 ? i - 1 : 0; // a step back, to try the better picture first
  }

  /// A size in the words people use, so "200 KB" is never shown as 204800.
  static String label(int bytes) {
    if (bytes >= 1024 * 1024) {
      final mb = bytes / (1024 * 1024);
      return '${mb == mb.roundToDouble() ? mb.toStringAsFixed(0) : mb.toStringAsFixed(1)} MB';
    }
    return '${(bytes / 1024).round()} KB';
  }
}
