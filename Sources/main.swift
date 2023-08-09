import SwiftSyntax

let stringExprSyntax = StringLiteralExprSyntax(
    openQuote: TokenSyntax(.stringQuote, presence: .present),
    segments: StringLiteralSegmentsSyntax([
        .stringSegment(.init(content:
                                TokenSyntax(.stringSegment("hoge"),
                                            presence: .present)))
    ]),
    closeQuote: TokenSyntax(.stringQuote, presence: .present)
)

let intExprSyntax = IntegerLiteralExprSyntax(digits: TokenSyntax(.integerLiteral("42"), presence: .present))
let nilExprSyntax = NilLiteralExprSyntax()
let identifierExprSyntax = IdentifierExprSyntax(identifier: TokenSyntax(.stringLiteral("fuga"), presence: .present))
let memberAccessExprSyntax = MemberAccessExprSyntax(base: identifierExprSyntax,
                                                    dot: .periodToken(),
                                                    name: TokenSyntax(.identifier("count"), presence: .present))

let functionCallExprSyntax = FunctionCallExprSyntax(calledExpression: identifierExprSyntax,
                                                    leftParen: TokenSyntax(.leftParen, presence: .present),
                                                    argumentList: TupleExprElementListSyntax([
                                                        TupleExprElementSyntax(expression: intExprSyntax)
                                                    ]),
                                                    rightParen: TokenSyntax(.rightParen, presence: .present))

let identifierPatternSyntax = IdentifierPatternSyntax(identifier: TokenSyntax(.identifier("fuga"), presence: .present))
let typeAnnotationSyntax = TypeAnnotationSyntax(type: SimpleTypeIdentifierSyntax(leadingTrivia: .space, name: .identifier("String")), trailingTrivia: .space)
let stringExprSyntaxWithTrivia = StringLiteralExprSyntax(
    leadingTrivia: .space,
    openQuote: TokenSyntax(.stringQuote, presence: .present),
    segments: StringLiteralSegmentsSyntax([
        .stringSegment(.init(content:
                                TokenSyntax(.stringSegment("hoge"),
                                            presence: .present)))
    ]),
    closeQuote: TokenSyntax(.stringQuote, presence: .present)
)
let initializerSyntax = InitializerClauseSyntax(value: stringExprSyntaxWithTrivia)
let variableDecl = VariableDeclSyntax(letOrVarKeyword: .letKeyword(trailingTrivia: .space),
                                      bindings: PatternBindingListSyntax([
                                        PatternBindingSyntax(pattern: identifierPatternSyntax,
                                                             typeAnnotation: typeAnnotationSyntax,
                                                             initializer: initializerSyntax)
                                      ]))

let arrayExprSytax = ArrayExprSyntax(elements: ArrayElementListSyntax(
    [
        ArrayElementSyntax(expression:
                            StringLiteralExprSyntax(openQuote: .stringQuoteToken(),
                                                    segments: StringLiteralSegmentsSyntax([
                                                        .stringSegment(.init(content:
                                                                                TokenSyntax(.stringSegment("hoge"),
                                                                                            presence: .present)))
                                                    ]),
                                                    closeQuote: .stringQuoteToken()),
                           trailingComma: .commaToken()),
        ArrayElementSyntax(expression:
                            StringLiteralExprSyntax(openQuote: .stringQuoteToken(),
                                                    segments: StringLiteralSegmentsSyntax([
                                                            .stringSegment(.init(content:
                                                                                    TokenSyntax(.stringSegment("foo"),
                                                                                                presence: .present)))
                                                    ]),
                                                    closeQuote: .stringQuoteToken()),
                           trailingComma: nil),
    ]
))

/*
 "hoge"
 42
 nil
 fuga
 fuga.count
 fuga(42)
 let fuga: String = "hoge"
 */
print(stringExprSyntax)
print(intExprSyntax)
print(nilExprSyntax)
print(identifierExprSyntax)
print(memberAccessExprSyntax)
print(functionCallExprSyntax)
print(variableDecl)
print(arrayExprSytax)
