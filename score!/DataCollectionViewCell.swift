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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 24
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.7
        contentView.layer.borderColor = UIColor.gray.cgColor
                
        title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)

        time.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(time)

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

