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
    private var nextEventView = UIView()
    
    private var seeAll = UIButton()
    private var upcomingLabel = UILabel()
    private var mensLabel = UILabel()
    private var womensLabel = UILabel()
    private var upcomingCollectionView: UICollectionView!
    private var mensCollectionView: UICollectionView!
    private var womensCollectionView: UICollectionView!
    
    private var nextUpLabel = UILabel()
    private var nextDate = UILabel()
    private var nextEvent = UILabel()
    private var nextOppo = UILabel()
    private var timeAtLocation = UILabel()
    private var bear = UIImageView()
    
    private var allTeams : [Team] = []
    
    private var upcomingEvents: [Event] = []
    private var nextUpcomingEvent: Event = Event()
    private var mensSports: [Team] = []
    private var womensSports: [Team] = []
    
    private let upcomingCellReuseIdentifier = "upcomingCellReuseIdentifier"
    private let sportsCellReuseIdentifier = "sportsCellReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "score!"
        view.backgroundColor = .white
        
        getUpcoming()
        
        getTeams()
        
        setupNextUp()
        
        setupView()
        
        setupLabels()
        
        setupCollections()
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        setupConstraints()
    }
    
    func getTeams() {
        NetworkManager.getAllTeams() { teams in
            self.allTeams = teams
            for team in self.allTeams {
                if team.gender == "Women's" {
                    self.womensSports.append(team)
                } else {
                    self.mensSports.append(team)
                }
            }
            self.mensCollectionView.reloadData()
            self.womensCollectionView.reloadData()
        }
    }
    
    func getUpcoming() {
        NetworkManager.getAllEvents() { events in
            self.upcomingEvents = events
            self.upcomingEvents.removeAll(where: {$0.unixTime < Int(NSDate().timeIntervalSince1970)})
            self.upcomingCollectionView.reloadData()
            self.nextUpcomingEvent = self.upcomingEvents[0]
            self.nextDate.text = self.nextUpcomingEvent.date
            self.nextEvent.text = self.nextUpcomingEvent.gender + " " + self.nextUpcomingEvent.sport
            self.nextOppo.text = "vs. " + self.nextUpcomingEvent.opponent
            self.timeAtLocation.text = self.nextUpcomingEvent.time + " @ " + self.nextUpcomingEvent.location + "!"
        }
    }
    
    func setupCollections() {
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
    }
    
    func setupView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 700, height: 800))
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.contentSize = contentView.frame.size
            
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        
        
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
        
        nextEventView.layer.masksToBounds = true
        nextEventView.clipsToBounds = false
        nextEventView.layer.borderColor = UIColor.white.cgColor
        nextEventView.layer.cornerRadius = 15
        nextEventView.layer.borderWidth = 2
        nextEventView.layer.backgroundColor = UIColor.white.cgColor
        nextEventView.layer.shadowColor = UIColor.lightGray.cgColor
        nextEventView.layer.shadowOffset = CGSize(width: 5, height: 5)
        nextEventView.layer.shadowRadius = 5.0
        nextEventView.layer.shadowOpacity = 1
        
        nextEventView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nextEventView)
    }
    
    @objc func seeAllTapped() {
        var filters = ["Women's", "Men's"]
        for team in self.allTeams {
            if !filters.contains(team.sport) {
                filters.append(team.sport)
            }
        }
        let upcomingView = UpcomingViewController(data: upcomingEvents, filters: filters)
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
        
        nextUpLabel.text = "Next Up"
        nextUpLabel.font = .systemFont(ofSize: 20)
        nextUpLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nextUpLabel)
    }
    
    func setupNextUp() {

        nextDate.font = .systemFont(ofSize: 18)
        nextDate.translatesAutoresizingMaskIntoConstraints = false
        nextEventView.addSubview(nextDate)
        
        nextEvent.font = .boldSystemFont(ofSize: 25)
        nextEvent.translatesAutoresizingMaskIntoConstraints = false
        nextEventView.addSubview(nextEvent)
        
        nextOppo.font = .boldSystemFont(ofSize: 25)
        nextOppo.translatesAutoresizingMaskIntoConstraints = false
        nextEventView.addSubview(nextOppo)
        
        timeAtLocation.font = .systemFont(ofSize: 18)
        timeAtLocation.translatesAutoresizingMaskIntoConstraints = false
        nextEventView.addSubview(timeAtLocation)
        
        bear.image = UIImage(named: "cutebear.jpeg")
        bear.contentMode = .scaleAspectFill
        bear.clipsToBounds = true
        bear.translatesAutoresizingMaskIntoConstraints = false
        nextEventView.addSubview(bear)
                
        NSLayoutConstraint.activate([
            nextDate.topAnchor.constraint(equalTo: nextEventView.topAnchor, constant: 45),
            nextDate.leadingAnchor.constraint(equalTo: nextEventView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            nextEvent.bottomAnchor.constraint(equalTo: nextEventView.centerYAnchor),
            nextEvent.leadingAnchor.constraint(equalTo: nextEventView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            nextOppo.topAnchor.constraint(equalTo: nextEvent.bottomAnchor, constant: 8),
            nextOppo.leadingAnchor.constraint(equalTo: nextEventView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            timeAtLocation.bottomAnchor.constraint(equalTo: nextEventView.bottomAnchor, constant: -15),
            timeAtLocation.leadingAnchor.constraint(equalTo: nextEventView.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            bear.trailingAnchor.constraint(equalTo: nextEventView.trailingAnchor, constant: -15),
            bear.heightAnchor.constraint(equalToConstant: 100),
            bear.widthAnchor.constraint(equalToConstant: 100),
            bear.centerYAnchor.constraint(equalTo: nextEventView.centerYAnchor)
        ])
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
            nextUpLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: collectionViewPadding),
            nextUpLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nextUpLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            nextUpLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 38),
        ])
        NSLayoutConstraint.activate([
            nextEventView.topAnchor.constraint(equalTo: nextUpLabel.bottomAnchor, constant: collectionViewPadding),
            nextEventView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: collectionViewPadding),
            nextEventView.bottomAnchor.constraint(equalTo: nextUpLabel.topAnchor, constant: 250),
            nextEventView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -collectionViewPadding)
        ])
        NSLayoutConstraint.activate([
            upcomingLabel.topAnchor.constraint(equalTo: nextEventView.bottomAnchor, constant: 25),
            upcomingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            upcomingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            upcomingLabel.bottomAnchor.constraint(equalTo: nextEventView.bottomAnchor, constant: 48),
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
            mensLabel.bottomAnchor.constraint(equalTo: upcomingCollectionView.bottomAnchor, constant: 46),
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
            womensLabel.bottomAnchor.constraint(equalTo: mensCollectionView.bottomAnchor, constant: 36),
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
            cell.layer.shadowOffset = CGSize(width: 6, height: 6)
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
            return CGSize(width: 175, height: 200)
        }
        if collectionView == mensCollectionView {
            return CGSize(width: 100, height: 80)
        }
        return CGSize(width: 100, height: 80)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellPadding
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == mensCollectionView {
            let team = mensSports[indexPath.item]
            let view = PushSportViewController(team: team)
            let vc = view
            navigationController?.pushViewController(vc, animated: true)
        }
        if collectionView == womensCollectionView {
            let team = womensSports[indexPath.item]
            let view = PushSportViewController(team: team)
            let vc = view
            navigationController?.pushViewController(vc, animated: true)
        }
        upcomingCollectionView.reloadData()
        mensCollectionView.reloadData()
        womensCollectionView.reloadData()
    }
}

