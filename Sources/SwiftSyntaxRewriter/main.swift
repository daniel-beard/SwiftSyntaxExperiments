
import Foundation
import SwiftSyntax

class Runner: SyntaxRewriter {

    let filename: String

    init(filename: String) {
        self.filename = filename
    }

    override func visit(_ node: EnumCaseDeclSyntax) -> DeclSyntax {

        if let enumDecl = node.parent?.parent?.parent as? EnumDeclSyntax {
            // child values are of type: EnumCaseElementListSyntax
            node.children.forEach({
                // child values are of type: EnumCaseElementSyntax
                $0.children.forEach { cv in
                    if let c = cv as? EnumCaseElementSyntax {
                        print(c.identifier, c.rawValue)
                    }
                }
            })

            print("Found enum case value: \(node) in enum named: \(enumDecl.identifier)")
        }

        return super.visit(node)
    }
}

// Required for now, because 'Syntax' is a protocol with extensions. Compiler complains when invoking .parse() otherwise.
private class ParserWrapper: Syntax { }

let file = URL(fileURLWithPath: "/Users/dbeard/enum.swift")
let parsed = try SyntaxTreeParser.parse(file)
let runner = Runner(filename: "")
runner.visit(parsed)

