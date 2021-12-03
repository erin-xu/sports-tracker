//
//  UpcomingViewController.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import UIKit

class UpcomingViewController: UIViewController {

    private var label = UILabel()
    private var filterCollectionView: UICollectionView!
    private var eventCollectionView: UICollectionView!
    
    private var filters: [Filter] = [Filter(name: "Women's"), Filter(name: "Men's"), Filter(name: "Basketball"), Filter(name: "Cross Country"), Filter(name: "Ice Hockey"), Filter(name: "Polo"), Filter(name: "Rowing"), Filter(name: "Soccer"), Filter(name: "Squash"), Filter(name: "Swimming")]
    
    private var filtersSelected: [Filter] = []
    
    private var data: [Event] = [Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432), Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432), Event(sport: "Soccer", gender: "Women's", result: "-", score: "-", opponent: "Columbia", location: "Field", time: "3:00pm", date: "Nov. 21, 2021", unixTime: 234432)]
    
    private var dataSelected: [Event] = []
    
    
    private let filterCellReuseIdentifier = "filterCellReuseIdentifier"
    private let dataCellReuseIdentifier = "dataCellReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upcoming Events"
        view.backgroundColor = .white
        
        filterData()
        
        label.text = "Events (" + String(dataSelected.count) + ")"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        view.addSubview(label)
        
        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = cellPadding
//        layout.minimumInteritemSpacing = cellPadding
        filterLayout.sectionInset = UIEdgeInsets(top: 0, left: sectionPadding, bottom: 0, right: sectionPadding)
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollectionView.backgroundColor = .clear
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.showsHorizontalScrollIndicator = false
        
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterCellReuseIdentifier)
        
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        
        view.addSubview(filterCollectionView)
        
        let eventLayout = UICollectionViewFlowLayout()
        eventLayout.scrollDirection = .vertical
        eventLayout.minimumLineSpacing = cellPadding
        eventLayout.minimumInteritemSpacing = cellPadding
        eventLayout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
        eventCollectionView = UICollectionView(frame: .zero, collectionViewLayout: eventLayout)
        eventCollectionView.backgroundColor = .clear
        eventCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        eventCollectionView.register(DataCollectionViewCell.self, forCellWithReuseIdentifier: dataCellReuseIdentifier)
        
        eventCollectionView.dataSource = self
        eventCollectionView.delegate = self
        
        view.addSubview(eventCollectionView)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            eventCollectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: collectionViewPadding),
            eventCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            eventCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            eventCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            filterCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
    
    func filterData() {
        dataSelected.removeAll()
        if filtersSelected.count == 0 {
            dataSelected = data
            return
        }
        for event in data {
            if fitsFilter(event: event) {
                dataSelected.append(event)
            }
        }
    }
    
    func fitsFilter(event: Event) -> Bool {
        for filter in filtersSelected {
            if event.category.contains(filter.name) {
                return true
            }
        }
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = title
    }
    
}

extension UpcomingViewController: UICollectionViewDataSource {

    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if cv == eventCollectionView {
            return dataSelected.count
        } else {
            return filters.count
        }
    }

    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if cv == eventCollectionView {
            let cell = eventCollectionView.dequeueReusableCell(withReuseIdentifier: dataCellReuseIdentifier, for: indexPath) as! DataCollectionViewCell
            let event = dataSelected[indexPath.item]
            cell.configure(for: event)
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 4, height: 4)
            cell.layer.shadowRadius = 3.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false
            return cell
        } else {
            let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            let filter = filters[indexPath.item]
            cell.configure(for: filter)
//            cell.layer.shadowColor = UIColor.lightGray.cgColor
//            cell.layer.shadowOffset = CGSize(width: 3, height: 3)
//            cell.layer.shadowRadius = 3.0
//            cell.layer.shadowOpacity = 1
//            cell.layer.masksToBounds = false
            return cell
        }
    }
}

extension UpcomingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ cv: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if cv == eventCollectionView {
            let size = eventCollectionView.frame.width - cellPadding
            return CGSize(width: size, height: 125)
        } else {
//            let filter = filters[indexPath.item]
//            let cell = FilterCollectionViewCell()
//            cell.configure(for: filter)
//            return CGSize(width: cell.label.frame.width, height: cell.label.frame.height)
            return CGSize(width: 120, height: 80)
        }
    }
    
    func collectionView(_ cv: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if cv == filterCollectionView {
            return cellPadding
        } else {
            return 0 + cellPadding
        }
    }

    func collectionView(_ cv: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if cv == filterCollectionView {
            let filter = filters[indexPath.item]
            
            if filter.isSelected == false {
                filter.isSelected = true
                filtersSelected.append(filter)
            } else {
                filter.isSelected = false
                filtersSelected.removeAll { f in
                    return f == filter
                }
            }
            
            filterData()
            label.text = "Events (" + String(dataSelected.count) + ")"
            
            let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            cell.select.toggle()
            
        }
        filterCollectionView.reloadData()
        eventCollectionView.reloadData()
    }

}

