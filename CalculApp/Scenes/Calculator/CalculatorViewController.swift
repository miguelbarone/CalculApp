//
//  ViewController.swift
//  CalculApp
//
//  Created by Miguel Barone on 16/04/25.
//

import UIKit

class CalculatorViewController: UIViewController {
    private var viewModel: CalculatorViewModeling

    weak var coordinator: CalculatorCoordinating?

    init(viewModel: CalculatorViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "CalculApp"
    }
}

extension CalculatorViewController: CalculatorViewModelDelegate {
    
}
