import 'package:bridgephoto/size_fit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('choosing where to start', () {
    test('a file already under the limit starts at the best step', () {
      expect(SizeFit.startFor(80 * 1024, 200 * 1024), 0);
      expect(SizeFit.startFor(200 * 1024, 200 * 1024), 0);
    });

    test('slightly over starts near the top, not at the bottom', () {
      expect(SizeFit.startFor(260 * 1024, 200 * 1024), lessThan(2));
    });

    test('wildly over skips ahead instead of grinding through every step', () {
      // A 12 MP page aiming at 100 KB: starting at step 0 would re-encode the
      // whole document eight times before anything useful happened.
      final start = SizeFit.startFor(6 * 1024 * 1024, 100 * 1024);
      expect(start, greaterThan(2));
      expect(start, lessThan(SizeFit.steps.length));
    });

    test('it never jumps past the end, however hopeless the target', () {
      final start = SizeFit.startFor(200 * 1024 * 1024, 1024);
      expect(start, inInclusiveRange(0, SizeFit.steps.length - 1));
    });

    test('a nonsense target does not crash it', () {
      expect(SizeFit.startFor(1000, 0), 0);
      expect(SizeFit.startFor(1000, -5), 0);
    });

    test('it errs one step BETTER than needed, never worse', () {
      // Overshooting costs picture quality that cannot be won back, so the
      // search must approach the limit from the good side.
      for (final over in [2, 4, 8, 16, 32]) {
        final start = SizeFit.startFor(over * 100 * 1024, 100 * 1024);
        final shrinkAtStart = 1.6 * start;
        expect(shrinkAtStart, lessThanOrEqualTo(over * 1.6),
            reason: 'started too aggressively for ${over}x over');
      }
    });
  });

  group('the steps themselves', () {
    test('every step is smaller and no better than the one before', () {
      for (var i = 1; i < SizeFit.steps.length; i++) {
        final (dimA, qA) = SizeFit.steps[i - 1];
        final (dimB, qB) = SizeFit.steps[i];
        expect(dimB, lessThan(dimA), reason: 'step $i is not smaller');
        expect(qB, lessThanOrEqualTo(qA), reason: 'step $i is not lower quality');
      }
    });

    test('resolution is given up before quality is ruined', () {
      // The first steps should still be readable: a page slightly reduced
      // reads fine, a page full of JPEG mush does not.
      final (_, q) = SizeFit.steps[2];
      expect(q, greaterThanOrEqualTo(70));
    });

    test('the last step really is small enough to be a last resort', () {
      final (dim, q) = SizeFit.steps.last;
      expect(dim, lessThanOrEqualTo(600));
      expect(q, lessThanOrEqualTo(40));
    });
  });

  group('showing a size in words', () {
    test('kilobytes and megabytes read the way people say them', () {
      expect(SizeFit.label(100 * 1024), '100 KB');
      expect(SizeFit.label(200 * 1024), '200 KB');
      expect(SizeFit.label(1024 * 1024), '1 MB');
      expect(SizeFit.label(2 * 1024 * 1024), '2 MB');
      expect(SizeFit.label(1536 * 1024), '1.5 MB');
    });

    test('every preset has a clean label — no 204800 anywhere', () {
      for (final p in SizeFit.presets) {
        final s = SizeFit.label(p);
        expect(s, anyOf(endsWith(' KB'), endsWith(' MB')));
        expect(s.length, lessThan(9));
      }
    });

    test('the presets are the limits real portals actually ask for', () {
      expect(SizeFit.presets, contains(200 * 1024)); // India NTA exam portal
      expect(SizeFit.presets, contains(500 * 1024)); // UAE MOHRE
      expect(SizeFit.presets, contains(1024 * 1024)); // Nepal passport
      expect(SizeFit.presets, contains(2 * 1024 * 1024)); // UAE ICP
    });
  });
}
