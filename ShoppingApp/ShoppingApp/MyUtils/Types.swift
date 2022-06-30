//
//  Types.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

public func createStackView(spacing: CGFloat, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment, axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.spacing = spacing
    stackView.distribution = distribution
    stackView.alignment = alignment
    stackView.axis = axis
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}

public func delay(dr: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + dr, execute: completion)
}
