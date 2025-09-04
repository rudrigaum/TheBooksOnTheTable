//
//  HomeViewController.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 04/09/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private var homeView: HomeView {
        guard let view = self.view as? HomeView else {
            fatalError("The view must be an instance of HomeView.")
        }
        return view
    }
    
    private let viewModel: HomeViewModel
    private weak var coordinator: HomeCoordinator?
    
    init(viewModel: HomeViewModel, coordinator: HomeCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "home"
        
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
        
        homeView.collectionView.register(HomeBookCell.self, forCellWithReuseIdentifier: "HomeBookCell")
        
        viewModel.fetchFeaturedBooks()
        homeView.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.featuredBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? HomeBookCell else {
            fatalError("Could not dequeue BookCell")
        }
    
        let book = viewModel.featuredBooks[indexPath.item]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {

}
