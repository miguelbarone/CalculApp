//
//  CalculatorView.swift
//  CalculApp
//
//  Created by Miguel Barone on 01/05/25.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    var body: some View {
        Color(uiColor: .black.withAlphaComponent(0.9))
            .ignoresSafeArea()
            .overlay(alignment: .bottom) {
                LazyVStack {
                    ZStack {
                        ScrollView(.horizontal) {
                            Text(viewModel.displayText)
                                .lineLimit(1)
                                .font(Font.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .foregroundStyle(.white)
                                .animation(.easeInOut(duration: 0.08), value: viewModel.displayText)
                        }
                        .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
                        .scrollIndicators(.hidden)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.white)
                    }

                    ZStack {
                        LazyVGrid(columns: [.init(.adaptive(minimum: 70))]) {
                            ForEach(0...viewModel.calculatorGrid.count - 1, id: \.self) { index in
                                Button {
                                    viewModel.didOperationSelected(at: index)
                                } label: {
                                    OperationView(model: viewModel.calculatorGrid[index])
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .padding()
            }
    }
}

#Preview {
    CalculatorView()
}
