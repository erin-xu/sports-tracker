//
//  SportCollectionViewCell.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    private var sport = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 4
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.gray.cgColor
                
        sport.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sport)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for sport: String) {
        self.sport.text = sport
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            sport.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            sport.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
}
