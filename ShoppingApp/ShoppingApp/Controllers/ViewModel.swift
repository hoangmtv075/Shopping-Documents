//
//  ViewModel.swift
//  ShoppingApp
//
//  Created by Thanh Hoang on 29/06/2022.
//

import UIKit

class ViewModel: NSObject {
    
    private let vc: ViewController
    
    init(vc: ViewController) {
        self.vc = vc
    }
}

//MARK: - GetData

extension ViewModel {
    
    func getData(completion: @escaping ([NSDictionary]) -> Void) {
        guard let url = Bundle.main.url(forResource: "Products.json", withExtension: nil),
        let data = try? Data(contentsOf: url),
        let json = try? JSONSerialization.jsonObject(with: data) as? NSDictionary,
        let array = json["Products"] as? [NSDictionary] else {
            return
        }
        
        DispatchQueue.main.async {
            completion(array)
        }
    }
}
