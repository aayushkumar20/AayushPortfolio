//
//  LanguagesViewCell.swift
//  AayushPortFolio
//
//  Created by Aayush kumar on 21/12/23.
//

import Foundation

/**
 Custom UITableViewCell for displaying language proficiency levels.

  ## Properties:
  - `title`: String? - The title of the cell.
  - `portugueseLevelFrame`: CGFloat? - The frame for the Portuguese language proficiency level.
  - `englishLevelFrame`: CGFloat? - The frame for the English language proficiency level.
  - `frenchLevelFrame`: CGFloat? - The frame for the French language proficiency level.

  ## Objects:
  - `cellTitle`: UILabel - The label displaying the cell title.
  - `cellView`: UIView - The main container view for the cell.
  - `portuguese`, `english`, `french`: UILabel - Labels for displaying language names.
  - `portugueseLevelBackground`, `englishLevelBackground`, `frenchLevelBackground`: UIView - Background views for language proficiency levels.
  - `portugueseLevel`, `englishLevel`, `frenchLevel`: UIView - Views representing language proficiency levels with gradient colors.

  ## Methods:
  - `configureLayout()`: Configures the layout of the cell, adding subviews and setting up constraints.

  ## Usage:
  - Initialize an instance of `LanguagesViewCell` and set its properties to display language information.

  ## Example:
  ```
  let cell = LanguagesViewCell(style: .default, reuseIdentifier: "LanguagesCell")
  cell.title = "Language Proficiency"
  cell.portugueseLevelFrame = 150
  cell.englishLevelFrame = 120
  cell.frenchLevelFrame = 90
 ```
 Note: Ensure to set the AboutMeModel.languages array with appropriate language names before using this cell.
 */

class LanguagesViewCell: UITableViewCell {
    
    //MARK: Properties
    var title: String? {
        didSet {
            guard let string = title else { return }
            
            cellTitle.text = string
        }
    }
    
    var portugueseLevelFrame: CGFloat? {
        didSet {
            guard let frame = portugueseLevelFrame else { return }
            portugueseLevel.frame = .init(x: 0, y: 0, width: frame, height: 6)
            portugueseLevel.trailingAnchor.constraint(equalTo: portugueseLevelBackground.trailingAnchor, constant: -2).isActive = true
        }
    }
    
    var englishLevelFrame: CGFloat? {
        didSet {
            guard let frame = englishLevelFrame else { return }
            englishLevel.frame = .init(x: 0, y: 0, width: frame, height: 6)
            englishLevel.trailingAnchor.constraint(equalTo: englishLevelBackground.trailingAnchor, constant: -(ConstraintsManager.width * 0.3)).isActive = true
        }
    }
    
    var frenchLevelFrame: CGFloat? {
        didSet {
            guard let frame = frenchLevelFrame else { return }
            frenchLevel.frame = .init(x: 0, y: 0, width: frame, height: 6)
            frenchLevel.trailingAnchor.constraint(equalTo: frenchLevelBackground.trailingAnchor, constant: -((ConstraintsManager.width * 0.6) + 15)).isActive = true
        }
    }
    
    //MARK: Objects
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 15)
        title.textAlignment = .left
        return title
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var portuguese: UILabel = {
        let label = UILabel()
        label.text = AboutMeModel.languages[0]
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = UIFont(name: "Nunito-SemiBold", size: 14)
        return label
    }()
    
    lazy var portugueseLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.1)
        line.layer.cornerRadius = 5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var portugueseLevel: UIView = {
        let line = UIView()
        line.frame = .init(x: 0, y: 0, width: ((ConstraintsManager.width * 0.8) - 17), height: 6)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        
        let gradient = CAGradientLayer()
        gradient.frame = line.bounds
        gradient.colors = [UIColor(red: 0.61, green: 0.17, blue: 0.47, alpha: 0.7).cgColor, UIColor(red: 0.8, green: 0.06, blue: 0.3, alpha: 0.8).cgColor, UIColor(red: 0.88, green: 0.3, blue: 0.16, alpha: 0.8).cgColor, UIColor(red: 0.99, green: 0.52, blue: 0.12, alpha: 0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        line.layer.addSublayer(gradient)
        
        return line
    }()
    
    lazy var english: UILabel = {
        let label = UILabel()
        label.text = AboutMeModel.languages[1]
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = UIFont(name: "Nunito-SemiBold", size: 14)
        return label
    }()
    
    lazy var englishLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.1)
        line.layer.cornerRadius = 5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var englishLevel: UIView = {
        let line = UIView()
        line.frame = .init(x: 0, y: 0, width: ((ConstraintsManager.width * 0.7)), height: 6)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        
        
        let gradient = CAGradientLayer()
        gradient.frame = line.bounds
        gradient.colors = [UIColor(red: 0.61, green: 0.17, blue: 0.47, alpha: 0.7).cgColor, UIColor(red: 0.8, green: 0.06, blue: 0.3, alpha: 0.8).cgColor, UIColor(red: 0.88, green: 0.3, blue: 0.16, alpha: 0.8).cgColor, UIColor(red: 0.99, green: 0.52, blue: 0.12, alpha: 0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        line.layer.addSublayer(gradient)
        return line
    }()
    
    lazy var french: UILabel = {
        let label = UILabel()
        label.text = AboutMeModel.languages[2]
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = UIFont(name: "Nunito-SemiBold", size: 14)
        return label
    }()
    
    lazy var frenchLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.1)
        line.layer.cornerRadius = 5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var frenchLevel: UIView = {
        let line = UIView()
        line.frame = .init(x: 0, y: 0, width: ((ConstraintsManager.width * 0.2) - 30), height: 6)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        
        let gradient = CAGradientLayer()
        gradient.frame = line.bounds
        gradient.colors = [UIColor(red: 0.61, green: 0.17, blue: 0.47, alpha: 0.7).cgColor, UIColor(red: 0.8, green: 0.06, blue: 0.3, alpha: 0.8).cgColor, UIColor(red: 0.88, green: 0.3, blue: 0.16, alpha: 0.8).cgColor, UIColor(red: 0.99, green: 0.52, blue: 0.12, alpha: 0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        line.layer.addSublayer(gradient)
        return line
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
    private func configureLayout() {

        backgroundColor = UIColor.clear
        
        let leading = layoutMarginsGuide.leadingAnchor
        
        let trailing = layoutMarginsGuide.trailingAnchor
        
        //Adding subviews
        addSubview(cellTitle)
        addSubview(cellView)
        cellView.addSubview(portuguese)
        cellView.addSubview(portugueseLevelBackground)
        cellView.addSubview(english)
        cellView.addSubview(englishLevelBackground)
        cellView.addSubview(french)
        cellView.addSubview(frenchLevelBackground)
        cellView.addSubview(portugueseLevel)
        englishLevelBackground.addSubview(englishLevel)
        frenchLevelBackground.addSubview(frenchLevel)
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        portuguese.translatesAutoresizingMaskIntoConstraints = false
        english.translatesAutoresizingMaskIntoConstraints = false
        french.translatesAutoresizingMaskIntoConstraints = false
        portugueseLevelBackground.translatesAutoresizingMaskIntoConstraints = false
        englishLevelBackground.translatesAutoresizingMaskIntoConstraints = false
        frenchLevelBackground.translatesAutoresizingMaskIntoConstraints = false
        portugueseLevel.translatesAutoresizingMaskIntoConstraints = false
        englishLevel.translatesAutoresizingMaskIntoConstraints = false
        frenchLevel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cellTitle.topAnchor.constraint(equalTo: topAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: leading),
            
            cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: leading),
            cellView.trailingAnchor.constraint(equalTo: trailing),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cellView.heightAnchor.constraint(equalToConstant: 190),
            
            portuguese.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            portuguese.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            portugueseLevelBackground.topAnchor.constraint(equalTo: portuguese.bottomAnchor, constant: 5),
            portugueseLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            portugueseLevelBackground.widthAnchor.constraint(equalToConstant: (ConstraintsManager.width * 0.8) - 15),
            portugueseLevelBackground.heightAnchor.constraint(equalToConstant: 10),
            
            portugueseLevel.centerYAnchor.constraint(equalTo: portugueseLevelBackground.centerYAnchor),
            portugueseLevel.leadingAnchor.constraint(equalTo: portugueseLevelBackground.leadingAnchor, constant: 2),
            portugueseLevel.heightAnchor.constraint(equalToConstant: 6),
            
            english.topAnchor.constraint(equalTo: portugueseLevelBackground.bottomAnchor, constant: 20),
            english.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            englishLevelBackground.topAnchor.constraint(equalTo: english.bottomAnchor, constant: 5),
            englishLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            englishLevelBackground.widthAnchor.constraint(equalToConstant: (ConstraintsManager.width * 0.8) - 15),
            englishLevelBackground.heightAnchor.constraint(equalToConstant: 10),
            
            englishLevel.centerYAnchor.constraint(equalTo: englishLevelBackground.centerYAnchor),
            englishLevel.leadingAnchor.constraint(equalTo: englishLevelBackground.leadingAnchor, constant: 2),
            englishLevel.heightAnchor.constraint(equalToConstant: 6),
            
            french.topAnchor.constraint(equalTo: englishLevelBackground.bottomAnchor, constant: 20),
            french.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            frenchLevelBackground.topAnchor.constraint(equalTo: french.bottomAnchor, constant: 5),
            frenchLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            frenchLevelBackground.widthAnchor.constraint(equalToConstant: (ConstraintsManager.width * 0.8) - 15),
            frenchLevelBackground.heightAnchor.constraint(equalToConstant: 10),
            
            frenchLevel.centerYAnchor.constraint(equalTo: frenchLevelBackground.centerYAnchor),
            frenchLevel.leadingAnchor.constraint(equalTo: frenchLevelBackground.leadingAnchor, constant: 2),
            frenchLevel.heightAnchor.constraint(equalToConstant: 6),
            
        ])
        
    }
    
}
