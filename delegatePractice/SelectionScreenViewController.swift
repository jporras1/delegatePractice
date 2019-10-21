//
//  SelectionScreenViewController.swift
//  delegatePractice
//
//  Created by Javier Porras jr on 10/21/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class SelectionScreenViewController: UIViewController {
    //MARK: Properties
    var delegate: SideSelectionDelegate?
    
    lazy var topImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "stormTrooper")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectTopImage)))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var bottomImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "r2d2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectBottomImage)))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupViews()
    }
    
    
    //MARK: Handlers
    @objc func didSelectTopImage(){
        delegate?.didTapChoice(name: "Darth Vador", image: UIImage(named: "vador")!, color: .red)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didSelectBottomImage(){
        delegate?.didTapChoice(name: "Yoda", image: UIImage(named: "yoda")!, color: .cyan)
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews(){
        view.addSubview(topImage)
        view.addSubview(bottomImage)
        
        topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImage.bottomAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: -12).isActive = true
        topImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        topImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        bottomImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomImage.topAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 12).isActive = true
        bottomImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bottomImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    

}

protocol SideSelectionDelegate {
    func didTapChoice(name: String, image: UIImage, color: UIColor)
}
