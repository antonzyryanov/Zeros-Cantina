//
//  PlanetsScreenViewController.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import UIKit

class PlanetsScreenViewController: VCWithCustomTabBar {
    
    var presenter: ViewToPresenterPlanetsScreenProtocol?
    
    var planetsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(UIScreen.main.bounds.width - 64, 500)
        layout.scrollDirection = .vertical
        planetsCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        
        planetsCollectionView.register(CardItemCollectionViewCell.self, forCellWithReuseIdentifier: CardItemCollectionViewCell.cellID)
        planetsCollectionView.delegate   = self
        planetsCollectionView.dataSource = self
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBar.navigateToScreen = navigateTo(screen: )
        super.viewWillAppear(animated)
        self.view.bringSubviewToFront(planetsCollectionView)
        self.presenter?.handleViewRequest()
    }

    private func setupCollectionView() {
        self.view.addSubview(planetsCollectionView)
        planetsCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(120)
        }
        planetsCollectionView.backgroundColor = .clear
        planetsCollectionView.reloadData()
    }
    
    private func openInfoAbout(planet: String) {
        let urlString = "https://www.google.com/search?q=" + planet.replacingOccurrences(of: " ", with: "+")
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
    private func navigateTo(screen: String) {
        presenter?.navigateTo(screen: screen)
    }
    
}

extension PlanetsScreenViewController: PresenterToViewPlanetsScreenProtocol{
    func updateView() {
        if planetsCollectionView != nil {
            DispatchQueue.main.async {
                self.planetsCollectionView.reloadData()
            }
        }
    }
}

extension PlanetsScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.presentationModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardItemCollectionViewCell.cellID, for: indexPath)
                as! CardItemCollectionViewCell
        cell.setupCellUI(cellType: "planet")
        if let model = presenter?.presentationModels[indexPath.row] {
            cell.configureWith(model: model)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = presenter?.presentationModels[indexPath.row] {
            openInfoAbout(planet: model.title)
        }
    }
    
}
