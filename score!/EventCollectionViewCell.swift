//
//  EventCollectionViewCell.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation

import UIKit

class EventCollectionViewCell: UICollectionViewCell {

    private var timeDate = UILabel()
    private var opponent = UILabel()
    private var resultScore = UILabel()
    private var location = UILabel()
    private var layerColor = UIColor()
    private var textColor = UIColor()
    
    func configure(for event: TeamEvent) {
        timeDate.text = event.time + " " + event.date
        opponent.text = event.opponent
        opponent.font = UIFont.preferredFont(forTextStyle: .body).bold()
        resultScore.text = event.win + " " + event.score
        location.text = event.location
        location.font = UIFont.preferredFont(forTextStyle: .footnote).italic()
        switch event.win {
        case "W":
            layerColor = UIColor.init(red: 18/255, green: 154/255, blue: 125/255, alpha: 1)
            textColor = .white
        case "L":
            layerColor = UIColor.init(red: 238/255, green: 105/255, blue: 105/255, alpha: 1)
            textColor = .white
        case "T":
            layerColor = UIColor.init(red: 112/255, green: 128/255, blue: 144/255, alpha: 1)
            textColor = .white
        default:
            layerColor = .white
            textColor = .black
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        contentView.backgroundColor = layerColor
        contentView.layer.borderWidth = 2.0
        contentView.layer.borderColor = layerColor.cgColor
        
        timeDate.translatesAutoresizingMaskIntoConstraints = false
        timeDate.textColor = textColor
        timeDate.font = .systemFont(ofSize: 12)
        contentView.addSubview(timeDate)
        opponent.translatesAutoresizingMaskIntoConstraints = false
        opponent.textColor = textColor
        opponent.font = .systemFont(ofSize: 17)
        contentView.addSubview(opponent)
        resultScore.translatesAutoresizingMaskIntoConstraints = false
        resultScore.textColor = textColor
        resultScore.font = .systemFont(ofSize: 17)
        contentView.addSubview(resultScore)
        location.translatesAutoresizingMaskIntoConstraints = false
        location.textColor = textColor
        location.font = .systemFont(ofSize: 12)
        contentView.addSubview(location)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            timeDate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            timeDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        
        NSLayoutConstraint.activate([
            opponent.topAnchor.constraint(equalTo: timeDate.bottomAnchor, constant: 10),
            opponent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            resultScore.centerYAnchor.constraint(equalTo: opponent.centerYAnchor),
            resultScore.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: opponent.bottomAnchor, constant: 10),
            location.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }

}

//extension UIFont {
//    func withTraits(traits:UIFontDescriptor.SymbolicTraits) -> UIFont {
//        let descriptor = fontDescriptor.withSymbolicTraits(traits)
//        return UIFont(descriptor: descriptor!, size: 0)
//    }
//
//    func bold() -> UIFont {
//        return withTraits(traits: .traitBold)
//    }
//
//    func italic() -> UIFont {
//        return withTraits(traits: .traitItalic)
//    }
//}
