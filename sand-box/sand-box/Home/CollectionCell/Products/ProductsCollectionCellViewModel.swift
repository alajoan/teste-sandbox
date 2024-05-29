//
//  ProductsCollectionCellViewModel.swift
//  sand-box
//
//  Created by Jonathan Rocha on 25/05/24.
//

import Foundation

class ProductsCollectionCellViewModel {
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    func configure(_ cell: ProductsCollectionCellView) {
        cell.configCell(product.imageURL)
    }
}
