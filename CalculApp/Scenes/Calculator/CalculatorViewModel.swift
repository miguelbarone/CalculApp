//
//  CalculatorViewModel.swift
//  CalculApp
//
//  Created by Miguel Barone on 17/04/25.
//

protocol CalculatorViewModeling {
    var delegate: CalculatorViewModelDelegate? { get set }
}

protocol CalculatorViewModelDelegate: AnyObject {
    
}

final class CalculatorViewModel: CalculatorViewModeling {
    weak var delegate: CalculatorViewModelDelegate?
}
