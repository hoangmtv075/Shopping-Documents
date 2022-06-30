//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    let scrollView = ProductScrollView()
    let refreshControl = UIRefreshControl()
    
    var containerView: ProductContainerView { return scrollView.containerView }
    
    var featuredView: ProductFeaturedView { return containerView.featuredView }
    var featuredCV: UICollectionView { return featuredView.collectionView }
    
    var bestSellerView: ProductBestSellerView { return containerView.bestSellerView }
    var bestSellerCV: UICollectionView { return bestSellerView.collectionView }
    
    lazy var allProduct: [Product] = []
    lazy var featuredProducts: [Product] = []
    lazy var bestSellerProducts: [Product] = []
    
    private var viewModel: ViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        viewModel.getData { array in
            self.allProduct = array.map({ Product(dict: $0) })
            self.featuredProducts = self.allProduct.filter({ $0.featured })
            self.bestSellerProducts = self.allProduct.filter({ $0.bestSeller })
            
            self.featuredView.reloadData()
            self.bestSellerView.reloadData()
        }
    }
}

//MARK: - Setups

extension ViewController {
    
    private func setupViews() {
        view.backgroundColor = .white
        
        viewModel = ViewModel(vc: self)
        
        //TODO: - ScrollView
        scrollView.setupViews(vc: self, dl: self, ref: refreshControl)
        
        featuredView.setupDataSourceAndDelegate(dl: self)
        bestSellerView.setupDataSourceAndDelegate(dl: self)
        
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    @objc private func handleRefresh() {
        refreshControl.beginRefreshing()
        
        delay(dr: 1.0) {
            self.refreshControl.endRefreshing()
        }
    }
}

//MARK: - UIScrollViewDelegate

extension ViewController: UIScrollViewDelegate {}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredCV {
            return featuredProducts.count
            
        } else { //collectionView == bestSellerCV
            return bestSellerProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVCell.id, for: indexPath) as! ProductCVCell
        
        if collectionView == featuredCV {
            cell.updateUI(product: featuredProducts[indexPath.item])
            
        } else { //collectionView == bestSellerCV
            cell.updateUI(product: bestSellerProducts[indexPath.item])
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {}

//MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bestSellerView.itemWidth, height: collectionView.frame.height)
    }
}
