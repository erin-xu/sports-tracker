//
//  SportCollectionViewCell.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    private var sport = UILabel()
    private var gender = ""
    private var id = 0
    private var icon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true

        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.white.cgColor
                
        sport.translatesAutoresizingMaskIntoConstraints = false
        sport.textColor = .black
        sport.font = .boldSystemFont(ofSize: 15)
        contentView.addSubview(sport)
        
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(icon)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for sport: Team) {
        self.sport.text = sport.sport
        self.gender = sport.gender
        self.id = sport.id
        setIcon()
    }
    
    func setIcon() {
        switch sport.text {
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
            sport.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            sport.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2),
            sport.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            icon.heightAnchor.constraint(equalToConstant: 25),
            icon.widthAnchor.constraint(equalToConstant: 25),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        ])
        
    }
}
