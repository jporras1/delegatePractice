//
//  ViewController.swift
//  delegatePractice
//
//  Created by Javier Porras jr on 10/20/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "starWarsLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        //imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 24)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose Your Side", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchDown)
        return button
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViews()
    }

    //MARK: Handlers
    func setupViews(){
        view.addSubview(imageView)
        view.addSubview(button)
        view.addSubview(label)
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        //button.layer.cornerRadius = button.frame.height / 2
//
//        let buttonRadius = button.frame.height / 2
//        print(buttonRadius)
    }
    
    @objc func didTapButton(_ sender: UIButton){
        let selectionVC = SelectionScreenViewController()
        selectionVC.delegate = self
        present(selectionVC, animated: true, completion: nil)
    }

}

extension ViewController: SideSelectionDelegate{
    func didTapChoice(name: String, image: UIImage, color: UIColor) {
        imageView.image = image
        label.text = name
        view.backgroundColor = color
    }
}

