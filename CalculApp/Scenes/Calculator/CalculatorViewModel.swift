//
//  CalculatorViewModel.swift
//  CalculApp
//
//  Created by Miguel Barone on 17/04/25.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    @Published var displayText = "0"

    let calculatorGrid: [OperationModel] = [
        .init(type: .number, text: "7"),
        .init(type: .number, text: "8"),
        .init(type: .number, text: "9"),
        .init(type: .clear, text: "C"),
        .init(type: .number, text: "4"),
        .init(type: .number, text: "5"),
        .init(type: .number, text: "6"),
        .init(type: .operator(.plus), text: "+"),
        .init(type: .number, text: "1"),
        .init(type: .number, text: "2"),
        .init(type: .number, text: "3"),
        .init(type: .operator(.minus), text: "-"),
        .init(type: .operator(.division), text: "÷"),
        .init(type: .number, text: "0"),
        .init(type: .operator(.times), text: "x"),
        .init(type: .result, text: "=")
    ]

    private var operations = "0"
    private var lastSelectedOperator: Character?
    private var isDisplayingResult = false

    func didOperationSelected(at index: Int) {
        let selectedOperation = calculatorGrid[index]

        if isDisplayingResult {
            displayText = "0"
            isDisplayingResult = false
        }

        switch selectedOperation.type {
        case .number:
            operations.append(selectedOperation.text)
            lastSelectedOperator = nil

            if displayText == "0" {
                displayText = String(selectedOperation.text)
                return
            }

            displayText.append(selectedOperation.text)
        case let .operator(operatorType):
            guard displayText != "0" else { return }

            if lastSelectedOperator != nil {
                // using only one type of operator for each selection
                _ = operations.popLast()
                displayText.removeLast(3)
            } else {
                // working with decimal values when creating operation expression
                operations.append(".0")
            }

            lastSelectedOperator = operatorType.toExpressionFormat()
            operations.append(operatorType.toExpressionFormat())

            displayText.append(" \(selectedOperation.text) ")
        case .clear:
            displayText = "0"
            clearAllOperations()
        case .result:
            displayText = String(calcOperations().formatted())
            clearAllOperations()
            isDisplayingResult = true
        }
    }
}

private extension CalculatorViewModel {
    func calcOperations() -> Double {
        if lastSelectedOperator != nil {
            _ = operations.popLast()
        }

        let expression = NSExpression(format: operations)
        return (expression.expressionValue(with: nil, context: nil) as? Double) ?? .zero
    }

    func clearAllOperations() {
        operations = "0"
        lastSelectedOperator = nil
    }
}
