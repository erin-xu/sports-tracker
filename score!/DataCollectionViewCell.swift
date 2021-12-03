//
//  DataCollectionViewCell.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation
import UIKit

class DataCollectionViewCell: UICollectionViewCell {

    private var title = UILabel()
    private var location = UILabel()
    private var time = UILabel()
    private var sportString: String = ""
    private var icon = UIImageView()
    private var opponentString: String = ""
    private var oppoIcon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 24
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.white.cgColor
                
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)

        time.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(time)
        
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)
        
        oppoIcon.contentMode = .scaleAspectFit
        oppoIcon.clipsToBounds = true
        oppoIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(oppoIcon)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for event: Event) {
        title.text = event.gender + " " + event.sport + " vs. " + event.opponent
        location.text = event.location
        location.font = UIFont.preferredFont(forTextStyle: .footnote).italic()
        time.text = String(event.time)
        sportString = event.sport
        opponentString = event.opponent
        setIcon()
    }
    
    func setIcon() {
        switch sportString {
        case "Soccer" :
            icon.image = UIImage(named: "soccer.png")
        case "Tennis":
            icon.image = UIImage(named: "tennis.png")
        case "Baseball":
            icon.image = UIImage(named: "baseball.png")
        case "Football":
            icon.image = UIImage(named: "football.png")
        case "Basketball":
            icon.image = UIImage(named: "basketball.png")
        case "Lacrosse":
            icon.image = UIImage(named: "lacrosse.png")
        case "Track":
            icon.image = UIImage(named: "track.png")
        default:
            icon.image = UIImage()
        }
        
        switch opponentString {
        case "Yale" :
            oppoIcon.image = UIImage(named: "yale.png")
        case "Columbia":
            oppoIcon.image = UIImage(named: "columbia.png")
        case "Stonybrook":
            oppoIcon.image = UIImage(named: "stonybrook.png")
        case "Brown":
            oppoIcon.image = UIImage(named: "brown.png")
        case "Harvard":
            oppoIcon.image = UIImage(named: "harvard.png")
        default:
            oppoIcon.image = UIImage()
        }
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            location.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/2),
            location.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 10),
            time.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/2),
            time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            icon.heightAnchor.constraint(equalToConstant: 35),
            icon.widthAnchor.constraint(equalToConstant: 35),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
        ])
        NSLayoutConstraint.activate([
            oppoIcon.topAnchor.constraint(equalTo: location.topAnchor),
            oppoIcon.heightAnchor.constraint(equalToConstant: 50),
            oppoIcon.widthAnchor.constraint(equalToConstant: 50),
            oppoIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -85)
        ])
    }

}

extension UIFont {
    func withTraits(traits:UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}

