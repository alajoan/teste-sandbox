//
//  DetailView.swift
//  sand-box
//
//  Created by Jonathan Rocha on 25/05/24.
//

import UIKit

final class DetailView: BaseView {
    private let containerView = UIView()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 26)
        label.textColor = UIColor(named: "main")
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 19)
        label.textColor = UIColor(named: "secondary")
        label.textAlignment = .left
        return label
    }()
    
    override func initialize() {
        backgroundColor = .white
        addSubview(containerView, enableConstraints: true)
        containerView.addSubviews([bannerImageView,
                                   titleLabel,
                                   descriptionLabel],
                                  enableConstraints: true)
        
        bannerImageView.applyshadowWithCorner(containerView: self,
                                              cornerRadious: 12)
    }
    
    private func bannerImageConstraints() {
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            bannerImageView.heightAnchor.constraint(equalToConstant: 160),
            bannerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bannerImageView.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 16)
        ])
    }
    
    private func titleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 16)
        ])
    }
    
    private func descriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
        ])
    }
    
    override func installConstraints() {
        containerView.anchorEqualTo(view: self)
        bannerImageConstraints()
        titleLabelConstraints()
        descriptionLabelConstraints()
    }
    
    func setBanner(_ bannerURL: String) {
        bannerImageView.downloaded(from: bannerURL)
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setDescription(_ description: String) {
        descriptionLabel.text = description
    }
}
