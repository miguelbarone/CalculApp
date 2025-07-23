//
//  OperationView.swift
//  CalculApp
//
//  Created by Miguel Barone on 10/07/25.
//

import SwiftUI

struct OperationView: View {
    let model: OperationModel

    var body: some View {
        ZStack {
            Text(String(model.text))
                .font(Font.title2)
                .padding([.top, .bottom], 16)
                .padding([.leading, .trailing], 24)
                .frame(width: 80)
        }
        .background(Color(uiColor: getBackgroundColor()))
        .cornerRadius(16)
    }

    private func getBackgroundColor() -> UIColor {
        switch model.type {
        case .number:
            return UIColor.systemGray4
        case .clear:
            return UIColor.systemGray2
        case .operator, .result:
            return UIColor.systemOrange
        }
    }
}
