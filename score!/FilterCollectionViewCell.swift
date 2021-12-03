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

    override init(frame: CGRect) {
        super.init(frame: frame)

//        contentView.layer.cornerRadius = 15
//        contentView.clipsToBounds = true
//        contentView.backgroundColor = .white
//        contentView.layer.borderWidth = 0.7
//        contentView.layer.borderColor = UIColor.white.cgColor

//        label.font = .systemFont(ofSize: 15)
//        label.translatesAutoresizingMaskIntoConstraints = false
        
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

        contentView.addSubview(label)

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
//        label.frame.size.width += 40
//        label.frame.size.height += 8
    }

    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: contentView.topAnchor),
//            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ])
        NSLayoutConstraint.activate([
//            sport.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

