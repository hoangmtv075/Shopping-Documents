//
//  ProductModel.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

struct ProductModel {
    
    let name: String
    let price: Double
    let featured: Bool
    let bestSeller: Bool
    let newArrival: Bool
    let description: String
    let imageURL: String
    let imageURLs: [String]
    let color: String
    let sizes: [String]
    let category: String
    let subcategory: String
    let isShow: Bool
    let uid: String
}

class Product {
    
    private let model: ProductModel
     
    var name: String { return model.name }
    var price: Double { return model.price }
    var featured: Bool { return model.featured }
    var bestSeller: Bool { return model.bestSeller }
    var newArrival: Bool { return model.newArrival }
    var description: String { return model.description }
    var imageURL: String { return model.imageURL }
    var imageURLs: [String] { return model.imageURLs }
    var color: String { return model.color }
    var sizes: [String] { return model.sizes }
    var category: String { return model.category }
    var subcategory: String { return model.subcategory }
    var isShow: Bool { return model.isShow }
    var uid: String { return model.uid }
    
    init(model: ProductModel) {
        self.model = model
    }
}

extension Product {
    
    convenience init(dict: NSDictionary) {
        let name = dict["name"] as? String ?? ""
        let price = dict["price"] as? Double ?? 0.0
        let featured = dict["featured"] as? Bool ?? false
        let bestSeller = dict["bestSeller"] as? Bool ?? false
        let newArrival = dict["newArrival"] as? Bool ?? false
        let description = dict["description"] as? String ?? ""
        let imageURL = dict["imageURL"] as? String ?? ""
        let imageURLs = dict["imageURLs"] as? [String] ?? []
        let color = dict["color"] as? String ?? ""
        let sizes = dict["sizes"] as? [String] ?? []
        let category = dict["category"] as? String ?? ""
        let subcategory = dict["subcategory"] as? String ?? ""
        let isShow = dict["isShow"] as? Bool ?? false
        let uid = dict["uid"] as? String ?? ""
        
        let model = ProductModel(name: name,
                                 price: price,
                                 featured: featured,
                                 bestSeller: bestSeller,
                                 newArrival: newArrival,
                                 description: description,
                                 imageURL: imageURL,
                                 imageURLs: imageURLs,
                                 color: color,
                                 sizes: sizes,
                                 category: category,
                                 subcategory: subcategory,
                                 isShow: isShow,
                                 uid: uid)
        self.init(model: model)
    }
}
