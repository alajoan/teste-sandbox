//
//  ErroView.swift
//  sand-box
//
//  Created by Jonathan Rocha on 25/05/24.
//

import UIKit

class ErrorView: UIView {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "main")
        button.layer.shadowOpacity = 0.0
        return button
    }()
    
    private lazy var errorImageView: UIImageView = {
        let imageView = UIImageView()
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "gearshape.2")
        } else {
            imageView.image = UIImage(named: "gearshape.2.jpg")
        }
        imageView.tintColor = UIColor(named: "main")
        return imageView
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    var buttonTapped: (()->())?
    
    var action: ButtonAction {
        didSet {
            button.setTitle(action.rawValue, for: .normal)
        }
    }
    
    required init(_ error: String, action: ButtonAction) {
        self.action = action
        super.init(frame: CGRect.zero)
        
        messageLabel.text = error
        button.setTitle(action.rawValue, for: .normal)
        
        addSubviews([
            errorImageView,
            messageLabel,
            button
        ],enableConstraints: true)
        errorImageViewConstraints()
        messageLabelConstraints()
        buttonConstraints()
    }
    
    private func errorImageViewConstraints() {
        NSLayoutConstraint.activate([
            errorImageView.topAnchor.constraint(equalTo: topAnchor, constant: 240),
            errorImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorImageView.heightAnchor.constraint(equalToConstant: 86),
            errorImageView.widthAnchor.constraint(equalToConstant: 86)
        ])
    }
    
    private func messageLabelConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: errorImageView.bottomAnchor, constant: 32),
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func buttonConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 120),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            button.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func tappedButton(sender: UIButton) {
        removeFromSuperview()
        buttonTapped?()
    }
    
    @discardableResult
    static func show(error: String,
                     in viewController: UIViewController,
                     action: ButtonAction, tap: (()->())? = nil) -> ErrorView {
        
        let errView = ErrorView(error, action: action)
        errView.button.addTarget(errView, action: #selector(ErrorView.tappedButton(sender:)), for: .touchUpInside)
        errView.buttonTapped = tap
        
        if let view = viewController.view {
            view.addSubview(errView, enableConstraints: true)
            errView.anchorEqualTo(view: view)
        }
        
        return errView
    }
}

enum ButtonAction: String {
    case back = "Voltar"
    case retry = "Tente novamente"
}
