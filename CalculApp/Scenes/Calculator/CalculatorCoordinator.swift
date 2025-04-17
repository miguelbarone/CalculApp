//
//  C.swift
//  CalculApp
//
//  Created by Miguel Barone on 17/04/25.
//

import UIKit

protocol CalculatorCoordinating: AnyObject {
    func start()
}

final class CalculatorCoordinator: CalculatorCoordinating {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = CalculatorViewModel()
        let viewController = CalculatorViewController(viewModel: viewModel)

        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }
}
