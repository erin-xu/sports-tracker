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

        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.gray.cgColor

        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false

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
            contentView.layer.borderColor = UIColor.systemTeal.cgColor
            contentView.layer.borderWidth = 2
        } else {
            contentView.layer.borderColor = UIColor.gray.cgColor
            contentView.layer.borderWidth = 0.7
        }
        label.sizeToFit()
        label.frame.size.width += 40
        label.frame.size.height += 8
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

