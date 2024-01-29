//
//  HomePageViewController.swift
//  InstagramCompositionalLayout
//
//  Created by Sagar on 1/27/24.
//

import UIKit

class HomePageViewController: UIViewController {

    let identifier = InstaCollectionViewCell.className
    var isFirstTimeLoaded = true
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCompositionalLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        let nib = UINib(nibName: InstaCollectionViewCell.className, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Welcome to Home Page")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if isFirstTimeLoaded {
            isFirstTimeLoaded = false
            view.layoutIfNeeded()
            setupCollectionView()
        }
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        collectionView.layoutIfNeeded()
    }
    
    private func getCompositionalLayout()-> UICollectionViewCompositionalLayout {
        let firstGroup = getFirstInstaLayoutGroup()
        let secondGroup = getSecondInstaLayoutGroup()
        let combinedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1)), subitems: [firstGroup, secondGroup])
        let section = NSCollectionLayoutSection(group: combinedGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func getFirstInstaLayoutGroup()-> NSCollectionLayoutGroup {
        
        let horizontallSingleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1.0/3.0), heightDimension: .fractionalHeight(1)))
        horizontallSingleItem.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        let firstGroupItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        firstGroupItem.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        let firstGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3.0), heightDimension: .fractionalHeight(1.0)), subitems: [firstGroupItem])
        firstGroup.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0/2.0)), subitems: [firstGroup, firstGroup, horizontallSingleItem])
        group.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        return group
    }
    
    private func getSecondInstaLayoutGroup()-> NSCollectionLayoutGroup {
        
        let horizontallSingleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1.0/3.0), heightDimension: .fractionalHeight(1)))
        horizontallSingleItem.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        let firstGroupItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        firstGroupItem.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        let firstGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3.0), heightDimension: .fractionalHeight(1.0)), subitems: [firstGroupItem])
        firstGroup.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0/2.0)), subitems: [horizontallSingleItem, firstGroup, firstGroup])
        group.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        return group
    }
}

extension HomePageViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

extension HomePageViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! InstaCollectionViewCell
        cell.backgroundColor = .random
        var rem = (indexPath.item % 10) + 1
        let imageName = String(rem)
        cell.imageView.image = UIImage(named: imageName)
        return cell
    }
}
    

extension UIColor {
    static var random : UIColor {
        return UIColor(red: .random(in: 0.4...1), green: .random(in: 0.4...1), blue: .random(in: 0.4...1), alpha: 1)
    }
}
    
