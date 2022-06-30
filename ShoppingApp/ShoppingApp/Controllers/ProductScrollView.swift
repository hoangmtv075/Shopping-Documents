//
//  ProductScrollView.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

class ProductScrollView: UIScrollView {
    
    //MARK: - Properties
    let containerView = ProductContainerView()
    
    //MARK: - Initializes
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//MARK: - Setups

extension ProductScrollView {
    
    func setupViews(vc: UIViewController, dl: UIScrollViewDelegate, ref: UIRefreshControl) {
        clipsToBounds = true
        backgroundColor = .clear
        refreshControl = ref
        delegate = dl
        contentInsetAdjustmentBehavior = .never
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        vc.view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - ContainerView
        addSubview(containerView)
        
        let cvHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 0.0)
        cvHeightConstraint.priority = .defaultLow
        cvHeightConstraint.isActive = true
        
        //TODO: - NSLayoutConstraint
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: vc.view.widthAnchor, multiplier: 1.0)
        ])
    }
}
