//
//  HeroesCardsViewController.swift
//
//  Created by Anton Zyryanov on 18.07.25.
//

import UIKit
import RxSwift
import RxCocoa

class HeroesCardsViewController: UIViewController {
    
    var router: HeroesCardsScreenRouter?
    
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var speed: UIProgressView!
    @IBOutlet weak var power: UIProgressView!
    @IBOutlet weak var stamina: UIProgressView!
    
    @IBOutlet weak var previousCharacter: UIButton!
    @IBOutlet weak var nextCharacter: UIButton!
    @IBOutlet weak var selectCharacter: UIButton!
    
    
    @IBOutlet weak var menuIcon: UIImageView!
    
    // MARK: Properties
    private let intent = HeroesCardsIntent()
    private let disposeBag = DisposeBag()
        
    // MARK: Inits
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
        intent.bind(toView: self)
        menuIcon.image = menuIcon.image?.withRenderingMode(.alwaysTemplate)
        menuIcon.tintColor = .white
        view.insetsLayoutMarginsFromSafeArea = false
        imageView.layer.cornerRadius = 16
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    public func update(withState state: HeroCardsState) {
        switch state {
        case is HeroPresenting:
            let heroState = state as! HeroPresenting
            showPresentState(withPresentState: heroState)
            break
        case is HeroSelected:
            let heroState = state as! HeroSelected
            showSelectedState(withHeroName: heroState.hero.name)
            break
        default:
            break
        }
    }
    
    private func showPresentState(withPresentState state: HeroPresenting) {
        let hero = state.hero
        nameLabel.text = hero.name
        imageView.image = UIImage(named: hero.name)
        speed.progress = hero.speed / 10
        power.progress = hero.power / 10
        stamina.progress = hero.stamina / 10
        
        nextCharacter.isEnabled = state.nextAvailable
        previousCharacter.isEnabled = state.previousAvailable
    }
    
    private func showSelectedState(withHeroName name: String) {
        
        openInfoAbout(character: name)
    }
    
    private func openInfoAbout(character: String) {
        let urlString = "https://www.google.com/search?q=" + character.replacingOccurrences(of: " ", with: "+") + "+star+wars"
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK: Methods
    private func bindButtons() {
        previousCharacter.rx.tap.bind {
            self.intent.onPreviousCharacterClicked()
        }.disposed(by: disposeBag)
        
        nextCharacter.rx.tap.bind {
            self.intent.onNextCharacterClicked()
        }.disposed(by: disposeBag)
        
        selectCharacter.rx.tap.bind {
            self.intent.onSelectCharacter()
        }.disposed(by: disposeBag)
    }
    
    
    @IBAction func goToMenuButtonTapped(_ sender: Any) {
        router?.navigateTo(screen: "Menu")
    }
    
}

