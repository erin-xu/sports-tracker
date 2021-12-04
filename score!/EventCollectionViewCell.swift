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
    private var layerColor = UIColor.white
    private var textColor = UIColor.black
    
    func configure(for event: TeamEvent) {
        timeDate.text = event.time + " " + event.date
        opponent.text = event.opponent
        opponent.font = UIFont.preferredFont(forTextStyle: .body).bold()
        resultScore.text = event.win + " " + event.score
        location.text = "@ " + event.location
        location.font = UIFont.preferredFont(forTextStyle: .footnote).italic()
        switch event.win {
        case "W":
            let layerColor = UIColor.init(red: 18/255, green: 154/255, blue: 125/255, alpha: 1)
            contentView.backgroundColor = layerColor
            contentView.layer.borderColor = layerColor.cgColor
            contentView.layer.shadowColor = UIColor.init(red: 18/255, green: 154/255, blue: 125/255, alpha: 1).cgColor
            contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
            contentView.layer.shadowRadius = 3.0
            contentView.layer.shadowOpacity = 0.5
            contentView.layer.masksToBounds = false
            timeDate.textColor = .white
            opponent.textColor = .white
            resultScore.textColor = .white
            location.textColor = .white
        case "L":
            let layerColor = UIColor.init(red: 194/255, green: 59/255, blue: 34/255, alpha: 1)
            contentView.backgroundColor = layerColor
            contentView.layer.borderColor = layerColor.cgColor
            contentView.layer.shadowColor = UIColor.init(red: 194/255, green: 59/255, blue: 34/255, alpha: 1).cgColor
            contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
            contentView.layer.shadowRadius = 3.0
            contentView.layer.shadowOpacity = 0.5
            contentView.layer.masksToBounds = false
            timeDate.textColor = .white
            opponent.textColor = .white
            resultScore.textColor = .white
            location.textColor = .white
        case "T":
            let layerColor = UIColor.init(red: 112/255, green: 128/255, blue: 144/255, alpha: 1)
            contentView.backgroundColor = layerColor
            contentView.layer.borderColor = layerColor.cgColor
            contentView.layer.shadowColor = UIColor.init(red: 112/255, green: 128/255, blue: 144/255, alpha: 1).cgColor
            contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
            contentView.layer.shadowRadius = 3.0
            contentView.layer.shadowOpacity = 0.5
            contentView.layer.masksToBounds = false
            timeDate.textColor = .white
            opponent.textColor = .white
            resultScore.textColor = .white
            location.textColor = .white
        default:
            contentView.backgroundColor = .white
            contentView.layer.borderColor = CGColor(gray: 1, alpha: 1)
            contentView.layer.shadowColor = UIColor.lightGray.cgColor
            contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
            contentView.layer.shadowRadius = 3.0
            contentView.layer.shadowOpacity = 1
            contentView.layer.masksToBounds = false
            timeDate.textColor = .gray
            opponent.textColor = .gray
            resultScore.textColor = .gray
            location.textColor = .gray
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 2.0
        
        timeDate.translatesAutoresizingMaskIntoConstraints = false
        timeDate.font = .systemFont(ofSize: 12)
        contentView.addSubview(timeDate)
        opponent.translatesAutoresizingMaskIntoConstraints = false
        opponent.font = .systemFont(ofSize: 17)
        contentView.addSubview(opponent)
        resultScore.translatesAutoresizingMaskIntoConstraints = false
        resultScore.font = .systemFont(ofSize: 17)
        contentView.addSubview(resultScore)
        location.translatesAutoresizingMaskIntoConstraints = false
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
