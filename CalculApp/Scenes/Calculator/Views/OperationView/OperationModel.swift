//
//  OperationModel.swift
//  CalculApp
//
//  Created by Miguel Barone on 10/07/25.
//

struct OperationModel {
    let type: OperationType
    let text: String
}

enum OperationType {
    case number
    case `operator`(Operator)
    case clear
    case result

    enum Operator {
        case plus
        case minus
        case times
        case division

        func toExpressionFormat() -> Character {
            switch self {
            case .plus:
                return "+"
            case .minus:
                return "-"
            case .times:
                return "*"
            case .division:
                return "/"
            }
        }
    }
}
