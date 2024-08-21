import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxAccordion', () {
    testWidgets('renders with required properties',
        (WidgetTester tester) async {
      await tester.pumpRxComponent(
        XAccordion(
          header: (context, spec) => RxAccordionHeaderSpecWidget(
            title: 'Test Accordion',
            spec: spec,
          ),
          content: (context, spec) => TextSpecWidget(
            'Accordion Content',
            spec: spec,
          ),
        ),
      );

      expect(find.text('Test Accordion'), findsOneWidget);
      expect(find.text('Accordion Content'), findsOneWidget);
    });

    testWidgets('renders with custom icons', (WidgetTester tester) async {
      await tester.pumpRxComponent(
        XAccordion(
          header: (context, spec) => RxAccordionHeaderSpecWidget(
            title: 'Custom Icons',
            spec: spec,
            leadingIcon: Icons.star,
            trailingIcon: Icons.arrow_drop_down,
          ),
          content: (context, spec) => TextSpecWidget(
            'Content',
            spec: spec,
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
    });

    // testWidgets('respects initiallyExpanded property', //
    //     (WidgetTester tester) async {
    //   await tester.pumpRxComponent(
    //     RxAccordion(
    //       title: 'Initially Expanded',
    //       content: Text('Expanded Content'),
    //       initiallyExpanded: true,
    //     ),
    //   );
    //   await tester.pumpAndSettle();

    //   final offstageWidget =
    //       tester.widgetList<Offstage>(find.byType(Offstage)).first;
    //   expect(offstageWidget.offstage, isTrue);
    // });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final accordion = AccordionSpecUtility.self;
      const color = Colors.purpleAccent;

      await tester.pumpRxComponent(
        XAccordion(
          header: (context, spec) => RxAccordionHeaderSpecWidget(
            spec: spec,
            title: 'Styled Accordion',
            trailingIcon: Icons.rocket_launch,
          ),
          content: (context, spec) => TextSpecWidget(
            'Styled Content',
            spec: spec,
          ),
          style: Style(
            accordion.header.trailingIcon.color(color),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.rocket_launch), findsOneWidget);

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, color);
    });
  });
}
