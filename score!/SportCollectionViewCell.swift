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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true

        contentView.backgroundColor = UIColor.init(red: 238/255, green: 105/255, blue: 105/255, alpha: 1)
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.init(red: 238/255, green: 105/255, blue: 105/255, alpha: 1).cgColor
                
        sport.translatesAutoresizingMaskIntoConstraints = false
        sport.textColor = .black
        sport.font = .boldSystemFont(ofSize: 15)
        contentView.addSubview(sport)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for sport: Team) {
        self.sport.text = sport.sport
        self.gender = sport.gender
        self.id = sport.id
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
//            sport.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            sport.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            sport.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2),
            sport.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
}
