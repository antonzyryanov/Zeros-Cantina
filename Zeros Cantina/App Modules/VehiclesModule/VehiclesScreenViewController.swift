//
//  VehiclesScreenViewController.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import UIKit

class VehiclesScreenViewController: VCWithCustomTabBar {
    
    var presenter: ViewToPresenterVehiclesScreenProtocol?
    
    var vehiclesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(UIScreen.main.bounds.width - 64, 500)
        layout.scrollDirection = .vertical
        vehiclesCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        
        vehiclesCollectionView.register(CardItemCollectionViewCell.self, forCellWithReuseIdentifier: CardItemCollectionViewCell.cellID)
        vehiclesCollectionView.delegate   = self
        vehiclesCollectionView.dataSource = self
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBar.navigateToScreen = navigateTo(screen: )
        super.viewWillAppear(animated)
        self.view.bringSubviewToFront(vehiclesCollectionView)
        self.presenter?.handleViewRequest()
    }

    private func setupCollectionView() {
        self.view.addSubview(vehiclesCollectionView)
        vehiclesCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(120)
        }
        vehiclesCollectionView.backgroundColor = .clear
        vehiclesCollectionView.reloadData()
    }
    
    private func openInfoAbout(vehicle: String) {
        let urlString = "https://www.google.com/search?q=" + vehicle.replacingOccurrences(of: " ", with: "+")
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
    private func navigateTo(screen: String) {
        presenter?.navigateTo(screen: screen)
    }
    
}

extension VehiclesScreenViewController: PresenterToViewVehiclesScreenProtocol{
    func updateView() {
        if vehiclesCollectionView != nil {
            DispatchQueue.main.async {
                self.vehiclesCollectionView.reloadData()
            }
        }
    }
}

extension VehiclesScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.presentationModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardItemCollectionViewCell.cellID, for: indexPath)
                as! CardItemCollectionViewCell
        cell.setupCellUI(cellType: "vehicle")
        if let model = presenter?.presentationModels[indexPath.row] {
            cell.configureWith(model: model)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = presenter?.presentationModels[indexPath.row] {
            openInfoAbout(vehicle: model.title)
        }
    }
    
}
