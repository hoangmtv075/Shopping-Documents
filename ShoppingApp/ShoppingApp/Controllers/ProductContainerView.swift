//
//  ProductContainerView.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

class ProductContainerView: UIView {
    
    //MARK: - Properties
    let featuredView = ProductFeaturedView()
    let bestSellerView = ProductBestSellerView()
    
    //MARK: - Initializes
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//MARK: - Setups

extension ProductContainerView {
    
    private func setupViews() {
        clipsToBounds = true
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - UIStackView
        let stackView = createStackView(spacing: 30.0, distribution: .fill, alignment: .center, axis: .vertical)
        stackView.addArrangedSubview(featuredView)
        stackView.addArrangedSubview(bestSellerView)
        addSubview(stackView)
        
        //TODO: - NSLayoutConstraint
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30.0),
        ])
    }
}
