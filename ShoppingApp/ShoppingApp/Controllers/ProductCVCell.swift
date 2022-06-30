//
//  ProductCVCell.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

class ProductCVCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let id = "ProductCVCell"
    
    let coverView = UIView()
    let coverImageView = UIImageView()
    
    let nameLbl = UILabel()
    let priceLbl = UILabel()
    
    static var nameHeight: CGFloat {
        return "HjmWg".estimatedString(font: UIFont.systemFont(ofSize: 16.0)).height
    }
    static var priceHeight: CGFloat {
        return "HjmWg".estimatedString(font: UIFont.boldSystemFont(ofSize: 18.0)).height
    }
    
    //MARK: - Initializes
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//MARK: - Configure

extension ProductCVCell {
    
    private func configureCell() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        //TODO: - CoverView
        coverView.clipsToBounds = true
        coverView.backgroundColor = .white
        coverView.layer.cornerRadius = 15.0
        coverView.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - CoverImageView
        coverImageView.clipsToBounds = true
        coverImageView.contentMode = .scaleAspectFill
        coverView.addSubview(coverImageView)
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - NameLbl
        nameLbl.font = UIFont.systemFont(ofSize: 16.0)
        nameLbl.textColor = .gray
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - PriceLbl
        priceLbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        priceLbl.textColor = .gray
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - UIStackView
        let stackView = createStackView(spacing: 10.0, distribution: .fill, alignment: .leading, axis: .vertical)
        stackView.addArrangedSubview(coverView)
        stackView.addArrangedSubview(nameLbl)
        stackView.addArrangedSubview(priceLbl)
        contentView.addSubview(stackView)
        
        //TODO: - NSLayoutConstraint
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            nameLbl.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.0),
            coverView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.0),
            coverView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1440/1080),
            
            coverImageView.topAnchor.constraint(equalTo: coverView.topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: coverView.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: coverView.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: coverView.bottomAnchor),
        ])
    }
}

//MARK: - UpdateUI

extension ProductCVCell {
    
    func updateUI(product: Product) {
        coverImageView.image = UIImage(named: product.imageURL)
        nameLbl.text = product.name
        priceLbl.text = "$\(product.price)"
    }
}
