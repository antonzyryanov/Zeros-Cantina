//
//  CharactersScreenViewController.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import UIKit

class CharactersScreenViewController: VCWithCustomTabBar {
    
    var presenter: ViewToPresenterCharactersScreenProtocol?
    
    var charactersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(UIScreen.main.bounds.width - 64, 500)
        layout.scrollDirection = .vertical
        charactersCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        
        charactersCollectionView.register(CardItemCollectionViewCell.self, forCellWithReuseIdentifier: CardItemCollectionViewCell.cellID)
        charactersCollectionView.delegate   = self
        charactersCollectionView.dataSource = self
        
        setupCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBar.navigateToScreen = navigateTo(screen: )
        super.viewWillAppear(animated)
        self.view.bringSubviewToFront(charactersCollectionView)
        self.presenter?.handleViewRequest()
    }

    private func setupCollectionView() {
        self.view.addSubview(charactersCollectionView)
        charactersCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(120)
        }
        charactersCollectionView.backgroundColor = .clear
        charactersCollectionView.reloadData()
    }
    
    private func openInfoAbout(character: String) {
        let urlString = "https://www.google.com/search?q=" + character.replacingOccurrences(of: " ", with: "+")
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
    private func navigateTo(screen: String) {
        presenter?.navigateTo(screen: screen)
    }
    
}

extension CharactersScreenViewController: PresenterToViewCharactersScreenProtocol{
    func updateView() {
        if charactersCollectionView != nil {
            DispatchQueue.main.async {
                self.charactersCollectionView.reloadData()
            }
        }
    }
}

extension CharactersScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.presentationModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardItemCollectionViewCell.cellID, for: indexPath)
                as! CardItemCollectionViewCell
        cell.setupCellUI(cellType: "character")
        if let model = presenter?.presentationModels[indexPath.row] {
            cell.configureWith(model: model)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = presenter?.presentationModels[indexPath.row] {
            openInfoAbout(character: model.title)
        }
    }
    
}
