//
//  HeroesCardsIntent.swift

//
//  Created by Anton Zyryanov on 18.07.25.

import Foundation
import RxSwift
import RxCocoa

class HeroesCardsIntent {
    var stateRelay: PublishRelay<HeroCardsState>
    var view: HeroesCardsViewController?
    let heroSelector = HeroesCardsSelector()
    var disposeBag = DisposeBag()
        
    init() {
        stateRelay = PublishRelay()
    }
    
    public func bind(toView view: HeroesCardsViewController) {
        self.view = view
        
        stateRelay.subscribe { event in
            guard let state = event.element else { return }
            self.view?.update(withState: state)
        }.disposed(by: disposeBag)
        
        let hero = heroSelector.currentHero
        let next = heroSelector.isNextHeroAvailable()
        let previous = heroSelector.isPreviousHeroAvailable()

        stateRelay.accept(HeroPresenting(withHero: hero,
                                                   nextAvailable: next,
                                                   previousAvailable: previous))
    }
    
    public func onPreviousCharacterClicked() {
        guard let hero = heroSelector.previousHero else { return }
        presentHero(hero: hero)
    }
    
    public func onNextCharacterClicked() {
        guard let hero = heroSelector.nextHero else { return }
        presentHero(hero: hero)
    }
    
    public func onSelectCharacter() {
        stateRelay.accept(HeroSelected(selectedHero: heroSelector.currentHero))
    }
    
    public func onDismissCharacter() {
        presentHero(hero: heroSelector.currentHero)
    }
    
    private func presentHero(hero: Hero) {
        let next = heroSelector.isNextHeroAvailable()
        let previous = heroSelector.isPreviousHeroAvailable()
        stateRelay.accept(HeroPresenting(withHero: hero,
        nextAvailable: next,
        previousAvailable: previous))
    }
}
