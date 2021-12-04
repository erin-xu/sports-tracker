//
//  PushSportViewController.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation

import UIKit

class PushSportViewController: UIViewController {
    
    private var team: Team
    
    private var scrollView: UIScrollView!
    private var contentView = UIView()
    private var sportView = UIView()
    private var sportPic = UIImageView()
    private var titleLabel = UILabel()
    
    private var collectionView: UICollectionView!
    
    //call getByTeam() to get list
    private var events: [TeamEvent] = []
    private let eventCellReuseIdentifier = "eventCellReuseIdentifier"
    
    private let cellPadding: CGFloat = 10
    
    init(team: Team) {
        self.team = team
        self.events = team.events
        self.titleLabel.text = team.gender + " " + team.sport
        super.init(nibName: nil, bundle: nil)
        switch self.titleLabel.text {
        case "Men's Soccer" :
            sportPic.image = UIImage(named: "msoccer.gif")
        case "Men's Tennis" :
            sportPic.image = UIImage(named: "mtennis.jpg")
        case "Men's Baseball" :
            sportPic.image = UIImage(named: "mbaseball.jpg")
        case "Men's Football" :
            sportPic.image = UIImage(named: "mfootball.jpg")
        case "Men's Basketball" :
            sportPic.image = UIImage(named: "mbasketball.jpg")
        case "Women's Soccer" :
            sportPic.image = UIImage(named: "wsoccer.jpg")
        case "Women's Tennis" :
            sportPic.image = UIImage(named: "wtennis.jpg")
        case "Women's Basketball" :
            sportPic.image = UIImage(named: "wbasketball.jpg")
        case "Women's Lacrosse" :
            sportPic.image = UIImage(named: "wlacrosse.jpeg")
        case "Women's Track" :
            sportPic.image = UIImage(named: "wtrack.jpg")
        default :
            sportPic.image = UIImage()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = UIColor.white
        
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = cellPadding
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: eventCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
        
        setupSportView()
        
        setupConstraints()
    }
    
    func setupSportView() {
        sportPic.contentMode = .scaleAspectFill
        sportPic.clipsToBounds = true
        sportPic.translatesAutoresizingMaskIntoConstraints = false
        sportView.addSubview(sportPic)
        
        titleLabel.font = .boldSystemFont(ofSize: 34)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        sportView.addSubview(titleLabel)
        
        sportView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sportView)
    }
    
    func setupConstraints(){
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            sportPic.topAnchor.constraint(equalTo: sportView.topAnchor),
            sportPic.leadingAnchor.constraint(equalTo: sportView.leadingAnchor),
            sportPic.trailingAnchor.constraint(equalTo: sportView.trailingAnchor),
            sportPic.bottomAnchor.constraint(equalTo: sportView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: sportView.bottomAnchor, constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: sportView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            sportView.topAnchor.constraint(equalTo: view.topAnchor),
            sportView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sportView.heightAnchor.constraint(equalToConstant: 300),
            sportView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: sportView.bottomAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }

    @objc func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }

}

extension PushSportViewController: UICollectionViewDataSource {

    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }

    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventCellReuseIdentifier, for: indexPath) as! EventCollectionViewCell
        cell.configure(for: events[indexPath.item])
        return cell
    }
}

extension PushSportViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ cv: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width - cellPadding
        return CGSize(width: size, height: 100)
    }
    
}
