import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'accordion.g.dart';
part 'accordion_style.dart';
part 'header/accordion_header.dart';
part 'header/accordion_header_spec_widget.dart';

part 'accordion_widget.dart';

@MixableSpec()
base class AccordionSpec extends Spec<AccordionSpec> with _$AccordionSpec {
  final BoxSpec container;
  @MixableProperty(dto: MixableFieldDto(type: 'AccordionHeaderSpecAttribute'))
  final AccordionHeaderSpec header;
  final BoxSpec contentContainer;
  final FlexSpec flex;
  final TextSpec textContent;

  /// {@macro avatar_spec_of}
  static const of = _$AccordionSpec.of;

  static const from = _$AccordionSpec.from;

  const AccordionSpec({
    BoxSpec? container,
    AccordionHeaderSpec? header,
    BoxSpec? contentContainer,
    FlexSpec? flex,
    TextSpec? textContent,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        header = header ?? const AccordionHeaderSpec(),
        contentContainer = contentContainer ?? const BoxSpec(),
        flex = flex ?? const FlexSpec(),
        textContent = textContent ?? const TextSpec();
}
