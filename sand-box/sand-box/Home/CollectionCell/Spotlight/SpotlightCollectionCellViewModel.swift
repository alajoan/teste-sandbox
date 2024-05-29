//
//  SpotlightCollectionViewCellViewModel.swift
//  sand-box
//
//  Created by Jonathan Rocha on 25/05/24.
//

import Foundation

class SpotlightCollectionCellViewModel {
    
    let spotlight: Spotlight
    
    init(_ spotlight: Spotlight) {
        self.spotlight = spotlight
    }
    
    func configure(_ cell: SpotlightCollectionCellView) {
        cell.configCell(spotlight.bannerURL)
    }
}
