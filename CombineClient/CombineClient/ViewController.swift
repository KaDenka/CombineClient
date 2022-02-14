//
//  ViewController.swift
//  CombineClient
//
//  Created by Denis Kazarin on 14.02.2022.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    var subscriptions: Set<AnyCancellable> = []
    private var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel(apiClient: APIClient())
        
        viewModel?.fetchCharacter(id: 3)
            .map({ characrer in
                characrer.description
            })
            .catch({ error in
                Empty<String, Never>()
            })
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] text in
                        self?.characterLabel.text = text
                    })
            .store(in: &subscriptions)
                    
                    
                    
        viewModel?.fetchLocation(id: 1)
            .map({ location in
                location.description
            })
            .catch({ error in
                Empty<String, Never>()
            })
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] text in
                        self?.locationLabel.text = text
                    })
            .store(in: &subscriptions)

        viewModel?.fetchEpisode(id: 8)
                    .map({ episode in
                        episode.description
                    })
                    .catch({ error in
                        Empty<String, Never>()
                    })
                    .receive(on: RunLoop.main)
                    .sink(receiveValue: { [weak self] text in
                                self?.episodeLabel.text = text
                            })
                    .store(in: &subscriptions)
    }
}

