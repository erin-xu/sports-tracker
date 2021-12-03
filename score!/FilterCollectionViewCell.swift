//
//  FilterCollectionViewCell.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation
import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var label = UILabel()
    var select = false
    var icon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.white.cgColor
        
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowRadius = 3.0
        contentView.layer.shadowOpacity = 1
        contentView.layer.masksToBounds = false
                
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        contentView.addSubview(label)

        //contentView.addSubview(label)
        
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for filter: Filter) {
        label.text = filter.name
        select = filter.isSelected
        if select {
            contentView.layer.shadowColor = UIColor.init(red: 238/255, green: 105/255, blue: 105/255, alpha: 1).cgColor
            contentView.layer.shadowRadius = 7.0
            label.textColor = UIColor.init(red: 238/255, green: 105/255, blue: 105/255, alpha: 1)
        } else {
            contentView.layer.shadowColor = UIColor.lightGray.cgColor
            contentView.layer.shadowRadius = 3.0
            label.textColor = .black
        }
        label.sizeToFit()
        setIcon()
    }
    
    func setIcon() {
        switch label.text {
        case "Women's" :
            icon.image = UIImage(named: "woman.png")
        case "Men's" :
            icon.image = UIImage(named: "man.png")
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
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            icon.heightAnchor.constraint(equalToConstant: 25),
            icon.widthAnchor.constraint(equalToConstant: 25),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        ])
    }
}

