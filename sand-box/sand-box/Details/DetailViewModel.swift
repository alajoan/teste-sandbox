//
//  DetailViewModel.swift
//  sand-box
//
//  Created by Jonathan Rocha on 27/05/24.
//

import Foundation

protocol DetailViewModelProcotol: AnyObject {
    var detailModel: DetailModel { get }
}

final class DetailViewModel {
    var detailModel: DetailModel
    
    init(detailModel: DetailModel) {
        self.detailModel = detailModel
    }
}

extension DetailViewModel: DetailViewModelProcotol {}
