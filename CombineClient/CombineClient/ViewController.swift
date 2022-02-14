//
//  ViewController.swift
//  CombineClient
//
//  Created by Denis Kazarin on 14.02.2022.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    var subscriptions: Set<AnyCancellable> = []
    private var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel(apiClient: APIClient())
        
        viewModel?.fetchCharacter(id: 3)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { print($0) })
            .store(in: &subscriptions)
        
        viewModel?.fetchLocation(id: 1)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { print($0) })
            .store(in: &subscriptions)
        
        viewModel?.fetchEpisode(id: 8)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { print($0) })
            .store(in: &subscriptions)
    }
}

