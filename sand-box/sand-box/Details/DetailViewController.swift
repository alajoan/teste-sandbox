//
//  DetailViewController.swift
//  sand-box
//
//  Created by Jonathan Rocha on 25/05/24.
//

import UIKit

final class DetailViewController: BaseViewController<DetailView> {
    let viewModel: DetailViewModelProcotol
    
    init(viewModel: DetailViewModelProcotol) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinds()
    }
}

extension DetailViewController {
    func setupBinds() {
        baseView.setBanner(viewModel.detailModel.bannerURL)
        baseView.setTitle(viewModel.detailModel.title)
        baseView.setDescription(viewModel.detailModel.description)
    }
}
