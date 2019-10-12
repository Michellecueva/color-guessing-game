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
       
    var counter = Counter() {
        didSet {
            currentScore.text = "Current Score: \(counter.currentScore)"
            highScore.text = "High Score:\(counter.Highscore)"
        }
    }
    
    var responseText = String() {
        didSet {
            responseLabel.text = responseText

        }
    }
    
    lazy var colorBox: UIView = {
        let view = UIView()
        view.backgroundColor = myCurrentColor.getNewColor()
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.setTitle("Red", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7850522995, green: 0.6849336624, blue: 0.4431889057, alpha: 1)
        button.addTarget(self, action: #selector(redButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var greenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Green", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7850522995, green: 0.6849336624, blue: 0.4431889057, alpha: 1)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(greenButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Blue", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7850522995, green: 0.6849336624, blue: 0.4431889057, alpha: 1)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(blueButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Game", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(resetGame), for: .touchUpInside)
        return button
    }()
    
    lazy var responseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var currentScore: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var highScore: UILabel = {
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
    
    lazy var scoreStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.addArrangedSubview(currentScore)
        stackView.addArrangedSubview(highScore)
        return stackView
    }()
    
    @objc func redButtonPressed() {
       checkDominantColor(buttonColor: redButton.titleLabel!.textColor)
    }
    
    @objc func greenButtonPressed() {
        checkDominantColor(buttonColor: greenButton.titleLabel!.textColor)
    }
    
    @objc func blueButtonPressed() {
        checkDominantColor(buttonColor: blueButton.titleLabel!.textColor)
    }
    
    
    @objc func resetGame() {
        startNewGame()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        setSubviews()
        addConstraints()
        startNewGame()
    }
    
    private func setSubviews() {
        colorBox.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(colorBox)
        buttonStackview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonStackview)
        scoreStackview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scoreStackview)
        responseLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(responseLabel)
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(newGameButton)

        
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            scoreStackview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            scoreStackview.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 125),
            scoreStackview.widthAnchor.constraint(equalToConstant: 200),
            scoreStackview.heightAnchor.constraint(equalToConstant: 100),
            
            colorBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            colorBox.topAnchor.constraint(equalTo: scoreStackview.bottomAnchor, constant: 30),
            colorBox.widthAnchor.constraint(equalToConstant: 250),
            colorBox.heightAnchor.constraint(equalToConstant: 250),
            
            responseLabel.centerXAnchor.constraint(equalTo: colorBox.centerXAnchor),
            responseLabel.topAnchor.constraint(equalTo: colorBox.bottomAnchor, constant: 30),
            responseLabel.widthAnchor.constraint(equalToConstant: 300),
            responseLabel.heightAnchor.constraint(equalToConstant: 50),
            
           buttonStackview.centerXAnchor.constraint(equalTo: responseLabel.centerXAnchor),
           buttonStackview.topAnchor.constraint(equalTo: responseLabel.bottomAnchor, constant: 20),
           buttonStackview.widthAnchor.constraint(equalToConstant: 250),
           buttonStackview.heightAnchor.constraint(equalToConstant: 30),
           
           newGameButton.centerXAnchor.constraint(equalTo: colorBox.centerXAnchor),
           newGameButton.centerYAnchor.constraint(equalTo: colorBox.centerYAnchor),
           newGameButton.widthAnchor.constraint(equalToConstant: 150),
           newGameButton.heightAnchor.constraint(equalToConstant: 50),
        ])
       
    }
    
    func disableButtons(){
           redButton.isEnabled = false
           blueButton.isEnabled = false
           greenButton.isEnabled = false
           newGameButton.isHidden = false
           
    }
    
    func checkDominantColor(buttonColor: UIColor) {
        if myCurrentColor.isDominant(guess: buttonColor) {
            counter.addToCurrentScore()
            responseText = "You win!"
            self.colorBox.backgroundColor = myCurrentColor.getNewColor()
        } else {
            responseText = "You lose!"
            disableButtons()
        }
    }
    
    func startNewGame() {
        myCurrentColor = ColorGuessing()
        colorBox.backgroundColor = myCurrentColor.getNewColor()
        redButton.isEnabled = true
        blueButton.isEnabled = true
        greenButton.isEnabled = true
        newGameButton.isHidden = true
        responseText = "Which color is the sample above closest to?"
        counter.resetCurrentScore()
    }
  
    
}

