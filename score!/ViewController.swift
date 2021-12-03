//
//  ViewController.swift
//  score!
//
//  Created by Erin Xu on 12/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var contentView = UIView()
    
    private var seeAll = UIButton()
    private var upcomingLabel = UILabel()
    private var mensLabel = UILabel()
    private var womensLabel = UILabel()
    private var upcomingCollectionView: UICollectionView!
    private var mensCollectionView: UICollectionView!
    private var womensCollectionView: UICollectionView!
    
    private var upcomingEvents: [Event] = [Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432), Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432), Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432)]
    private var mensSports: [String] = ["Soccer", "Baseball", "Badminton", "Hockey"]
    private var womensSports: [String] = ["Volleyball", "Soccer", "Tennis", "Basketball", "Badminton"]
    
    private let upcomingCellReuseIdentifier = "upcomingCellReuseIdentifier"
    private let sportsCellReuseIdentifier = "sportsCellReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Score!"
        view.backgroundColor = .white
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 700, height: 800))
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.contentSize = contentView.frame.size
            
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        
        
        seeAll.layer.borderWidth = 1
        seeAll.setTitle(" see all >", for: .normal)
        seeAll.setTitleColor(UIColor.init(red: 238/255, green: 105/255, blue: 105/255, alpha: 1), for: UIControl.State.normal)
        seeAll.backgroundColor = UIColor.white
        seeAll.layer.borderColor = UIColor.white.cgColor
        seeAll.layer.cornerRadius = 5
        seeAll.sizeToFit()
        seeAll.translatesAutoresizingMaskIntoConstraints = false
        seeAll.addTarget(self, action: #selector(seeAllTapped), for: .touchUpInside)
        contentView.addSubview(seeAll)
        
        setupLabels()
        
        let layout1 = UICollectionViewFlowLayout()
        layout1.scrollDirection = .horizontal
        layout1.minimumLineSpacing = cellPadding
        layout1.minimumInteritemSpacing = cellPadding
        layout1.sectionInset = UIEdgeInsets(top: 0, left: sectionPadding, bottom: 0, right: sectionPadding)
        
        upcomingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout1)
        upcomingCollectionView.backgroundColor = .clear
        upcomingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        upcomingCollectionView.showsHorizontalScrollIndicator = false
        
        upcomingCollectionView.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: upcomingCellReuseIdentifier)
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        contentView.addSubview(upcomingCollectionView)
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .horizontal
        layout2.minimumLineSpacing = cellPadding
        layout2.minimumInteritemSpacing = cellPadding
        layout2.sectionInset = UIEdgeInsets(top: 0, left: sectionPadding, bottom: 0, right: sectionPadding)
        
        mensCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        mensCollectionView.backgroundColor = .clear
        mensCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mensCollectionView.showsHorizontalScrollIndicator = false
        
        mensCollectionView.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: sportsCellReuseIdentifier)
        
        mensCollectionView.dataSource = self
        mensCollectionView.delegate = self
        
        contentView.addSubview(mensCollectionView)
        
        let layout3 = UICollectionViewFlowLayout()
        layout3.scrollDirection = .horizontal
        layout3.minimumLineSpacing = cellPadding
        layout3.minimumInteritemSpacing = cellPadding
        layout3.sectionInset = UIEdgeInsets(top: 0, left: sectionPadding, bottom: 0, right: sectionPadding)
        
        womensCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout3)
        womensCollectionView.backgroundColor = .clear
        womensCollectionView.translatesAutoresizingMaskIntoConstraints = false
        womensCollectionView.showsHorizontalScrollIndicator = false
        
        womensCollectionView.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: sportsCellReuseIdentifier)
        
        womensCollectionView.dataSource = self
        womensCollectionView.delegate = self
        
        contentView.addSubview(womensCollectionView)
        
        scrollView.addSubview(contentView)
        
        view.addSubview(scrollView)
        
        setupConstraints()
    }
    
    @objc func seeAllTapped() {
        let upcomingView = UpcomingViewController()
        let vc = upcomingView
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupLabels() {
        upcomingLabel.text = "Upcoming Events"
        upcomingLabel.font = .systemFont(ofSize: 20)
        upcomingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(upcomingLabel)
        
        mensLabel.text = "Men's Sports"
        mensLabel.font = .systemFont(ofSize: 20)
        mensLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mensLabel)
        
        womensLabel.text = "Women's Sports"
        womensLabel.font = .systemFont(ofSize: 20)
        womensLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(womensLabel)
    }
    
    func setupConstraints() {
        let collectionViewPadding: CGFloat = 8
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.1)
        ])
        NSLayoutConstraint.activate([
            upcomingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: collectionViewPadding),
            upcomingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            upcomingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            upcomingLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 34),
        ])
        NSLayoutConstraint.activate([
            seeAll.centerYAnchor.constraint(equalTo: upcomingLabel.centerYAnchor),
            seeAll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
        NSLayoutConstraint.activate([
            upcomingCollectionView.topAnchor.constraint(equalTo: upcomingLabel.bottomAnchor, constant: collectionViewPadding),
            upcomingCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: collectionViewPadding),
            upcomingCollectionView.bottomAnchor.constraint(equalTo: upcomingLabel.topAnchor, constant: 250),
            upcomingCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -collectionViewPadding)
        ])
        NSLayoutConstraint.activate([
            mensLabel.topAnchor.constraint(equalTo: upcomingCollectionView.bottomAnchor, constant: 25),
            mensLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            mensLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            mensLabel.bottomAnchor.constraint(equalTo: upcomingCollectionView.bottomAnchor, constant: 44),
        ])
        NSLayoutConstraint.activate([
            mensCollectionView.topAnchor.constraint(equalTo: mensLabel.bottomAnchor, constant: collectionViewPadding),
            mensCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: collectionViewPadding),
            mensCollectionView.bottomAnchor.constraint(equalTo: mensLabel.topAnchor, constant: 150),
            mensCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -collectionViewPadding)
        ])
        NSLayoutConstraint.activate([
            womensLabel.topAnchor.constraint(equalTo: mensCollectionView.bottomAnchor, constant: 15),
            womensLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            womensLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            womensLabel.bottomAnchor.constraint(equalTo: mensCollectionView.bottomAnchor, constant: 34),
        ])
        NSLayoutConstraint.activate([
            womensCollectionView.topAnchor.constraint(equalTo: womensLabel.bottomAnchor, constant: collectionViewPadding),
            womensCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: collectionViewPadding),
            womensCollectionView.bottomAnchor.constraint(equalTo: womensLabel.topAnchor, constant: 150),
            womensCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -collectionViewPadding)
        ])
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upcomingCollectionView {
            return upcomingEvents.count
        }
        if collectionView == womensCollectionView {
            return womensSports.count
        }
        return mensSports.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upcomingCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: upcomingCellReuseIdentifier, for: indexPath) as! UpcomingCollectionViewCell
            let event = upcomingEvents[indexPath.item]
            cell.configure(for: event)
            
            cell.layer.shadowColor = UIColor.init(red: 244/255, green: 193/255, blue: 193/255, alpha: 1).cgColor
            cell.layer.shadowOffset = CGSize(width: 6, height: 10)
            cell.layer.shadowRadius = 3.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false
            return cell
        }
        if collectionView == mensCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sportsCellReuseIdentifier, for: indexPath) as! SportCollectionViewCell
            let sport = mensSports[indexPath.item]
            cell.configure(for: sport)
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 3, height: 3)
            cell.layer.shadowRadius = 3.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sportsCellReuseIdentifier, for: indexPath) as! SportCollectionViewCell
        let sport = womensSports[indexPath.item]
        cell.configure(for: sport)
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        return cell
        
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize  {
        if collectionView == upcomingCollectionView {
//            let size = upcomingCollectionView.frame.width / 2.0 - 15
            return CGSize(width: 175, height: 200)
        }
        if collectionView == mensCollectionView {
//            let size = mensCollectionView.frame.width / 3.0 - 20
            return CGSize(width: 100, height: 80)
        }
//        let size = womensCollectionView.frame.width / 3.0 - 20
        return CGSize(width: 100, height: 80)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellPadding
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == mensCollectionView {
            let view = PushSportViewController()
            let vc = view
            navigationController?.pushViewController(vc, animated: true)
        }
        upcomingCollectionView.reloadData()
        mensCollectionView.reloadData()
        womensCollectionView.reloadData()
    }
}

