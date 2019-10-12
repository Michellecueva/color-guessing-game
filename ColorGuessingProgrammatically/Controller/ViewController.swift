//
//  ViewController.swift
//  ColorGuessingProgrammatically
//
//  Created by Michelle Cueva on 10/9/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myCurrentColor = ColorGuessing()
       
    var counter = Counter()
    
    lazy var colorBox: UIView = {
        let view = UIView()
        view.backgroundColor = .green
//        view.layer.cornerRadius = view.frame.height / 2
        return view
    }()
    
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.setTitle("red", for: .normal)
        button.backgroundColor = .blue
//        button.addTarget(self, action: #selector(redButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var greenButton: UIButton = {
        let button = UIButton()
        button.setTitle("green", for: .normal)
        button.backgroundColor = .blue
//        button.addTarget(self, action: #selector(greenButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("blue", for: .normal)
        button.backgroundColor = .blue
//        button.addTarget(self, action: #selector(blueButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var newGameButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var responseLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           return label
    }()
    
    lazy var currentScoreInt: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           return label
    }()
    
    lazy var highScoreInt: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           return label
    }()
    
    lazy var buttonStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(blueButton)
        stackView.addArrangedSubview(greenButton)
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setSubviews()
        addConstraints()
    }
    
    private func setSubviews() {
           colorBox.translatesAutoresizingMaskIntoConstraints = false
           self.view.addSubview(colorBox)
           buttonStackview.translatesAutoresizingMaskIntoConstraints = false
           self.view.addSubview(buttonStackview)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            colorBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            colorBox.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            colorBox.widthAnchor.constraint(equalToConstant: 250),
            colorBox.heightAnchor.constraint(equalToConstant: 250),
           buttonStackview.centerXAnchor.constraint(equalTo: colorBox.centerXAnchor),
           buttonStackview.topAnchor.constraint(equalTo: colorBox.bottomAnchor, constant: 20),
           buttonStackview.widthAnchor.constraint(equalToConstant: 250),
           buttonStackview.heightAnchor.constraint(equalToConstant: 30),
        ])
       
    }
    
    func disableButtons(){
           redButton.isEnabled = false
           blueButton.isEnabled = false
           greenButton.isEnabled = false
           newGameButton.isHidden = false
           
    }

}

