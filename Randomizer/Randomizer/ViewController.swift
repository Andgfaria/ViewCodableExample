//
//  ViewController.swift
//  Randomizer
//
//  Created by André Gimenez Faria on 03/01/2018.
//  Copyright © 2018 André Gimenez Faria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let numberLabel = UILabel()
    
    private let randomizeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup(with: [numberLabel,randomizeButton])
    }

}


extension ViewController : ViewCodable {
    
    func setupConstraints() {
        numberLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 72).isActive = true
        numberLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        numberLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -24).isActive = true
        
        randomizeButton.widthAnchor.constraint(equalToConstant: 144).isActive = true
        randomizeButton.heightAnchor.constraint(equalToConstant: 144).isActive = true
        randomizeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        randomizeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 24).isActive = true
    }
    
    func setupStyles() {
        view.backgroundColor = .black
        
        numberLabel.font = UIFont.boldSystemFont(ofSize: 72)
        numberLabel.textAlignment = .center
        numberLabel.textColor = .white
        
        randomizeButton.backgroundColor = .white
        randomizeButton.layer.cornerRadius = 72
        randomizeButton.layer.masksToBounds = true
        randomizeButton.setTitle("Randomize", for: .normal)
        randomizeButton.setTitleColor(.black, for: .normal)
    }

    func bindComponents() {
        randomizeButton.addTarget(self, action: #selector(randomize), for: .touchUpInside)
    }
    
}

extension ViewController {
    
    @objc func randomize() {
        let randomNumber = Int(arc4random_uniform(100) + 1)
        numberLabel.text = "\(randomNumber)"
    }
    
}
