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
    
    private var collectionView: UICollectionView!
    
    //call getByTeam() to get list
    private var events: [Event] = [Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432), Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432), Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432)]
    private let eventCellReuseIdentifier = "eventCellReuseIdentifier"
    
    private let cellPadding: CGFloat = 10
    
    init(team: Team) {
        self.team = team
        self.events = team.events
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = team.gender + " " + team.sport
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
        view.addSubview(collectionView)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
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
