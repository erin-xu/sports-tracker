//
//  UpcomingCollectionViewCell.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    private var date = UILabel()
    private var sport = UILabel()
    private var opponent = UILabel()
    private var location = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true

        contentView.backgroundColor = UIColor.init(red: 238/255, green: 105/255, blue: 105/255, alpha: 1)
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.init(red: 238/255, green: 105/255, blue: 105/255, alpha: 1).cgColor
                
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textColor = .white
        date.font = .systemFont(ofSize: 12)
        contentView.addSubview(date)
        
        sport.translatesAutoresizingMaskIntoConstraints = false
        sport.textColor = .white
        sport.font = .boldSystemFont(ofSize: 17)
        contentView.addSubview(sport)
        
        opponent.translatesAutoresizingMaskIntoConstraints = false
        opponent.textColor = .white
        opponent.font = .boldSystemFont(ofSize: 17)
        contentView.addSubview(opponent)
        
        location.translatesAutoresizingMaskIntoConstraints = false
        location.textColor = .white
        location.font = .systemFont(ofSize: 12)
        contentView.addSubview(location)
        
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(for event: Event) {
        date.text = event.date
        sport.text = event.gender + " " + event.sport
        opponent.text = "vs. " + event.opponent
        location.text = event.location
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: contentView.topAnchor),
            date.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 3/4),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            sport.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -35),
            sport.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2),
            sport.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            opponent.topAnchor.constraint(equalTo: sport.topAnchor, constant: 60),
            opponent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            location.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            location.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        
    }
}
