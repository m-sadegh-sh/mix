import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('RoundedRectangleBorderDto', () {
    test('merge should combine two RoundedRectangleBorderDtos correctly', () {
      const original = RoundedRectangleBorderDto(
        borderRadius: BorderRadiusGeometryDto(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(10),
        ),
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const RoundedRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(25),
          ),
          side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
        ),
      );

      expect(merged.borderRadius!.topLeft, const Radius.circular(25));
      expect(merged.borderRadius!.topRight, const Radius.circular(20));
      expect(merged.borderRadius!.bottomLeft, const Radius.circular(5));
      expect(merged.borderRadius!.bottomRight, const Radius.circular(10));

      expect(merged.side!.color, const ColorDto(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test(
      'resolve should create a RoundedRectangleBorder with the correct values',
      () {
        const dto = RoundedRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
        );

        final roundedRectangleBorder = dto.resolve(EmptyMixData);

        final borderRadius =
            roundedRectangleBorder.borderRadius as BorderRadius;

        expect(borderRadius.topLeft, const Radius.circular(15));
        expect(borderRadius.topRight, const Radius.circular(20));
        expect(borderRadius.bottomLeft, const Radius.circular(5));
        expect(borderRadius.bottomRight, const Radius.circular(10));

        expect(roundedRectangleBorder.side.color, Colors.red);
        expect(roundedRectangleBorder.side.width, 1.0);
      },
    );
  });

  // CircleBorderDto
  group('CircleBorderDto', () {
    test('merge should combine two CircleBorderDtos correctly', () {
      const original = CircleBorderDto(
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
        eccentricity: 0.5,
      );
      final merged = original.merge(
        const CircleBorderDto(
          side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
          eccentricity: 0.75,
        ),
      );

      expect(merged.eccentricity, 0.75);
      expect(merged.side!.color, const ColorDto(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test('resolve should create a CircleBorder with the correct values', () {
      const dto = CircleBorderDto(
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
        eccentricity: 0.5,
      );

      final circleBorder = dto.resolve(EmptyMixData);

      expect(circleBorder.eccentricity, 0.5);
      expect(circleBorder.side.color, Colors.red);
      expect(circleBorder.side.width, 1.0);
    });
  });

  // BeveledRectangleBorderDto
  group('BeveledRectangleBorderDto', () {
    test('merge should combine two BeveledRectangleBorderDtos correctly', () {
      const original = BeveledRectangleBorderDto(
        borderRadius: BorderRadiusGeometryDto(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(10),
        ),
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const BeveledRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(25),
          ),
          side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
        ),
      );

      expect(merged.borderRadius!.topLeft, const Radius.circular(25));
      expect(merged.borderRadius!.topRight, const Radius.circular(20));
      expect(merged.borderRadius!.bottomLeft, const Radius.circular(5));
      expect(merged.borderRadius!.bottomRight, const Radius.circular(10));

      expect(merged.side!.color, const ColorDto(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test(
      'resolve should create a BeveledRectangleBorder with the correct values',
      () {
        const dto = BeveledRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
        );

        final beveledRectangleBorder = dto.resolve(EmptyMixData);

        final borderRadius =
            beveledRectangleBorder.borderRadius as BorderRadius;

        expect(borderRadius.topLeft, const Radius.circular(15));
        expect(borderRadius.topRight, const Radius.circular(20));
        expect(borderRadius.bottomLeft, const Radius.circular(5));
        expect(borderRadius.bottomRight, const Radius.circular(10));

        expect(beveledRectangleBorder.side.color, Colors.red);
        expect(beveledRectangleBorder.side.width, 1.0);
      },
    );
  });

  // StadiumBorderDto
  group('StadiumBorderDto', () {
    test('merge should combine two StadiumBorderDtos correctly', () {
      const original = StadiumBorderDto(
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
      );
      final merged = original.merge(
        const StadiumBorderDto(
          side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
        ),
      );

      expect(merged.side!.color, const ColorDto(Colors.blue));
      expect(merged.side!.width, 2.0);
    });

    test('resolve should create a StadiumBorder with the correct values', () {
      const dto = StadiumBorderDto(
        side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
      );

      final stadiumBorder = dto.resolve(EmptyMixData);

      expect(stadiumBorder.side.color, Colors.red);
      expect(stadiumBorder.side.width, 1.0);
    });
  });

  // ContinuousRectangleBorderDto
  group('ContinuousRectangleBorderDto', () {
    test(
      'merge should combine two ContinuousRectangleBorderDtos correctly',
      () {
        const original = ContinuousRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
        );
        final merged = original.merge(
          const ContinuousRectangleBorderDto(
            borderRadius: BorderRadiusGeometryDto(
              topLeft: Radius.circular(25),
            ),
            side: BorderSideDto(color: ColorDto(Colors.blue), width: 2.0),
          ),
        );

        expect(merged.borderRadius!.topLeft, const Radius.circular(25));
        expect(merged.borderRadius!.topRight, const Radius.circular(20));
        expect(merged.borderRadius!.bottomLeft, const Radius.circular(5));
        expect(merged.borderRadius!.bottomRight, const Radius.circular(10));

        expect(merged.side!.color, const ColorDto(Colors.blue));
        expect(merged.side!.width, 2.0);
      },
    );

    test(
      'resolve should create a ContinuousRectangleBorder with the correct values',
      () {
        const dto = ContinuousRectangleBorderDto(
          borderRadius: BorderRadiusGeometryDto(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSideDto(color: ColorDto(Colors.red), width: 1.0),
        );

        final continuousRectangleBorder = dto.resolve(EmptyMixData);

        final borderRadius =
            continuousRectangleBorder.borderRadius as BorderRadius;

        expect(borderRadius.topLeft, const Radius.circular(15));
        expect(borderRadius.topRight, const Radius.circular(20));
        expect(borderRadius.bottomLeft, const Radius.circular(5));
        expect(borderRadius.bottomRight, const Radius.circular(10));

        expect(continuousRectangleBorder.side.color, Colors.red);
        expect(continuousRectangleBorder.side.width, 1.0);
      },
    );
  });

  // Tests for ShapeBorderDto
  group('ShapeBorderDto', () {
    test(
        'maybeFrom factory method should create the correct ShapeBorderDto subclass or return null',
        () {
      const roundedRectangleBorder = RoundedRectangleBorder();
      const circleBorder = CircleBorder();
      const beveledRectangleBorder = BeveledRectangleBorder();
      const continuousRectangleBorder = ContinuousRectangleBorder();
      const stadiumBorder = StadiumBorder();

      expect(ShapeBorderDto.maybeFrom(roundedRectangleBorder),
          isA<RoundedRectangleBorderDto>());
      expect(ShapeBorderDto.maybeFrom(circleBorder), isA<CircleBorderDto>());
      expect(ShapeBorderDto.maybeFrom(beveledRectangleBorder),
          isA<BeveledRectangleBorderDto>());
      expect(ShapeBorderDto.maybeFrom(continuousRectangleBorder),
          isA<ContinuousRectangleBorderDto>());
      expect(ShapeBorderDto.maybeFrom(stadiumBorder), isA<StadiumBorderDto>());
      expect(ShapeBorderDto.maybeFrom(null), isNull);
    });
  });

  // Tests for OutlinedBorderDto
  group('OutlinedBorderDto', () {
    test(
        'from factory method should create the correct OutlinedBorderDto subclass',
        () {
      const roundedRectangleBorder = RoundedRectangleBorder();
      const circleBorder = CircleBorder();
      const beveledRectangleBorder = BeveledRectangleBorder();
      const continuousRectangleBorder = ContinuousRectangleBorder();
      const stadiumBorder = StadiumBorder();

      expect(OutlinedBorderDto.from(roundedRectangleBorder),
          isA<RoundedRectangleBorderDto>());
      expect(OutlinedBorderDto.from(circleBorder), isA<CircleBorderDto>());
      expect(OutlinedBorderDto.from(beveledRectangleBorder),
          isA<BeveledRectangleBorderDto>());
      expect(OutlinedBorderDto.from(continuousRectangleBorder),
          isA<ContinuousRectangleBorderDto>());
      expect(OutlinedBorderDto.from(stadiumBorder), isA<StadiumBorderDto>());
    });

    test('resolve method should create the correct OutlinedBorder instance',
        () {
      const roundedRectangleBorderDto = RoundedRectangleBorderDto();
      const circleBorderDto = CircleBorderDto();
      const beveledRectangleBorderDto = BeveledRectangleBorderDto();
      const continuousRectangleBorderDto = ContinuousRectangleBorderDto();
      const stadiumBorderDto = StadiumBorderDto();

      expect(roundedRectangleBorderDto.resolve(EmptyMixData),
          isA<RoundedRectangleBorder>());
      expect(circleBorderDto.resolve(EmptyMixData), isA<CircleBorder>());
      expect(beveledRectangleBorderDto.resolve(EmptyMixData),
          isA<BeveledRectangleBorder>());
      expect(continuousRectangleBorderDto.resolve(EmptyMixData),
          isA<ContinuousRectangleBorder>());
      expect(stadiumBorderDto.resolve(EmptyMixData), isA<StadiumBorder>());
    });
  });

  // Additional tests for RoundedRectangleBorderDto
  group('RoundedRectangleBorderDto', () {
    test(
        'from factory method should create RoundedRectangleBorderDto from RoundedRectangleBorder',
        () {
      final roundedRectangleBorder = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.red),
      );

      final roundedRectangleBorderDto =
          RoundedRectangleBorderDto.from(roundedRectangleBorder);

      expect(roundedRectangleBorderDto.borderRadius,
          equals(BorderRadiusGeometryDto.from(BorderRadius.circular(10))));
      expect(roundedRectangleBorderDto.side,
          equals(BorderSideDto.from(const BorderSide(color: Colors.red))));
    });

    test('merge method should handle null values correctly', () {
      final roundedRectangleBorderDto = RoundedRectangleBorderDto(
        borderRadius: BorderRadiusGeometryDto.from(BorderRadius.circular(10)),
        side: BorderSideDto.from(const BorderSide(color: Colors.red)),
      );

      final mergedDto = roundedRectangleBorderDto.merge(null);

      expect(mergedDto, equals(roundedRectangleBorderDto));
    });
  });

  // Additional tests for CircleBorderDto
  group('CircleBorderDto', () {
    test('from factory method should create CircleBorderDto from CircleBorder',
        () {
      const circleBorder = CircleBorder(
        side: BorderSide(color: Colors.blue),
        eccentricity: 0.8,
      );

      final circleBorderDto = CircleBorderDto.from(circleBorder);

      expect(circleBorderDto.side,
          equals(BorderSideDto.from(const BorderSide(color: Colors.blue))));
      expect(circleBorderDto.eccentricity, equals(0.8));
    });

    test('merge method should handle null values correctly', () {
      final circleBorderDto = CircleBorderDto(
        side: BorderSideDto.from(const BorderSide(color: Colors.blue)),
        eccentricity: 0.8,
      );

      final mergedDto = circleBorderDto.merge(null);

      expect(mergedDto, equals(circleBorderDto));
    });
  });

  // Additional tests for BeveledRectangleBorderDto
  group('BeveledRectangleBorderDto', () {
    test(
        'from factory method should create BeveledRectangleBorderDto from BeveledRectangleBorder',
        () {
      final beveledRectangleBorder = BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.green),
      );

      final beveledRectangleBorderDto =
          BeveledRectangleBorderDto.from(beveledRectangleBorder);

      expect(beveledRectangleBorderDto.borderRadius,
          equals(BorderRadiusGeometryDto.from(BorderRadius.circular(10))));
      expect(beveledRectangleBorderDto.side,
          equals(BorderSideDto.from(const BorderSide(color: Colors.green))));
    });

    test('merge method should handle null values correctly', () {
      final beveledRectangleBorderDto = BeveledRectangleBorderDto(
        borderRadius: BorderRadiusGeometryDto.from(BorderRadius.circular(10)),
        side: BorderSideDto.from(const BorderSide(color: Colors.green)),
      );

      final mergedDto = beveledRectangleBorderDto.merge(null);

      expect(mergedDto, equals(beveledRectangleBorderDto));
    });
  });

  // Additional tests for ContinuousRectangleBorderDto
  group('ContinuousRectangleBorderDto', () {
    test(
        'from factory method should create ContinuousRectangleBorderDto from ContinuousRectangleBorder',
        () {
      final continuousRectangleBorder = ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.orange),
      );

      final continuousRectangleBorderDto =
          ContinuousRectangleBorderDto.from(continuousRectangleBorder);

      expect(continuousRectangleBorderDto.borderRadius,
          equals(BorderRadiusGeometryDto.from(BorderRadius.circular(10))));
      expect(continuousRectangleBorderDto.side,
          equals(BorderSideDto.from(const BorderSide(color: Colors.orange))));
    });

    test('merge method should handle null values correctly', () {
      final continuousRectangleBorderDto = ContinuousRectangleBorderDto(
        borderRadius: BorderRadiusGeometryDto.from(BorderRadius.circular(10)),
        side: BorderSideDto.from(const BorderSide(color: Colors.orange)),
      );

      final mergedDto = continuousRectangleBorderDto.merge(null);

      expect(mergedDto, equals(continuousRectangleBorderDto));
    });
  });

  // Additional tests for StadiumBorderDto
  group('StadiumBorderDto', () {
    test(
        'from factory method should create StadiumBorderDto from StadiumBorder',
        () {
      const stadiumBorder = StadiumBorder(
        side: BorderSide(color: Colors.purple),
      );

      final stadiumBorderDto = StadiumBorderDto.from(stadiumBorder);

      expect(stadiumBorderDto.side,
          equals(BorderSideDto.from(const BorderSide(color: Colors.purple))));
    });

    test('merge method should handle null values correctly', () {
      final stadiumBorderDto = StadiumBorderDto(
        side: BorderSideDto.from(const BorderSide(color: Colors.purple)),
      );

      final mergedDto = stadiumBorderDto.merge(null);

      expect(mergedDto, equals(stadiumBorderDto));
    });
  });
}
