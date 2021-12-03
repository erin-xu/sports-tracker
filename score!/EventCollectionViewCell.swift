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
    private var color = CGColor.init(gray: 0.5, alpha: 1.0)
    
    func configure(for event: Event) {
        timeDate.text = event.time + " " + event.date
        opponent.text = event.opponent
        opponent.font = UIFont.preferredFont(forTextStyle: .body).bold()
        resultScore.text = event.result + " " + event.score
        location.text = event.location
        location.font = UIFont.preferredFont(forTextStyle: .footnote).italic()
        switch event.result {
        case "W":
            color = CGColor.init(red:0,green:255,blue:0,alpha:1.0)
        case "L":
            color = CGColor.init(red:255,green:0,blue:0,alpha:1.0)
        case "T":
            color = CGColor.init(red:0,green:0,blue:255,alpha:1.0)
        default:
            color = CGColor.init(gray: 0.5, alpha: 1.0)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = color
        
        timeDate.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timeDate)
        opponent.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(opponent)
        resultScore.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(resultScore)
        location.translatesAutoresizingMaskIntoConstraints = false
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
