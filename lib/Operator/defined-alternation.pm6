unit module Operator::defined-alternation;

class DefinedAlternationContainer {
    has $.item;
    has $.condition-was-defined;
}

sub infix:<?//>(\a, \b -->DefinedAlternationContainer) is export {
    with a { return DefinedAlternationContainer.new(item => b, condition-was-defined => True) }
    DefinedAlternationContainer.new(item => Any, condition-was-defined => False)
}

sub infix:<!!>(DefinedAlternationContainer:D \cont, \b) is export {
	cont.condition-was-defined ?? cont.item !! b
}
