//
//  ProductBestSellerView.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

class ProductBestSellerView: UIView {
    
    //MARK: - Properties
    let titleView = UIView()
    let titleLbl = UILabel()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let viewAllBtn = UIButton()
    
    let itemWidth: CGFloat = (screenWidth-70) / 2.2
    var itemHeight: CGFloat {
        return itemWidth * (1440/1080) + ProductCVCell.nameHeight + ProductCVCell.priceHeight + 30
    }
    
    var cvWidth: CGFloat {
        return screenWidth
    }
    
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

extension ProductBestSellerView {
    
    private func setupViews() {
        clipsToBounds = true
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        
        let heightConstraint = heightAnchor.constraint(equalToConstant: 0.0)
        heightConstraint.priority = UILayoutPriority(750)
        heightConstraint.isActive = true
        
        //TODO: - TitleView
        titleView.clipsToBounds = true
        titleView.backgroundColor = .white
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.widthAnchor.constraint(equalToConstant: screenWidth-40).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        //TODO: - TitleLbl
        titleLbl.font = UIFont.boldSystemFont(ofSize: 22.0)
        titleLbl.text = "Best Seller"
        titleView.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - CollectionView
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ProductCVCell.self, forCellWithReuseIdentifier: ProductCVCell.id)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.widthAnchor.constraint(equalToConstant: cvWidth).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20.0
        layout.minimumInteritemSpacing = 0.0
        
        //TODO: - ViewAllBtn
        viewAllBtn.clipsToBounds = true
        viewAllBtn.layer.cornerRadius = 50/2
        viewAllBtn.backgroundColor = .black
        viewAllBtn.setTitle("View All", for: .normal)
        viewAllBtn.setTitleColor(.white, for: .normal)
        viewAllBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        viewAllBtn.translatesAutoresizingMaskIntoConstraints = false
        viewAllBtn.widthAnchor.constraint(equalToConstant: screenWidth-40).isActive = true
        viewAllBtn.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        //TODO: - UIStackView
        let stackView = createStackView(spacing: 10.0, distribution: .fill, alignment: .center, axis: .vertical)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(collectionView)
        stackView.addArrangedSubview(viewAllBtn)
        addSubview(stackView)
        
        //TODO: - NSLayoutConstraint
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLbl.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleLbl.trailingAnchor.constraint(lessThanOrEqualTo: titleView.trailingAnchor),
            titleLbl.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
        ])
    }
    
    func setupDataSourceAndDelegate(dl: UICollectionViewDataSource & UICollectionViewDelegate) {
        collectionView.dataSource = dl
        collectionView.delegate = dl
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
