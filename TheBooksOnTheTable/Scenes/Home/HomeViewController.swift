//
//  HomeViewController.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 04/09/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView!
    
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
        self.homeView = HomeView()
        self.view = homeView
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
        let count = viewModel.featuredBooks.count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBookCell", for: indexPath) as? HomeBookCell else {
            fatalError("Could not dequeue HomeBookCell")
        }
    
        let book = viewModel.featuredBooks[indexPath.item]
        cell.configure(with: book)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let selectedBook = viewModel.featuredBooks[indexPath.item]
        
        coordinator?.navigateToBookDetail(book: selectedBook)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - 40) / 2

        return CGSize(width: 80, height: 140)
    }
}

