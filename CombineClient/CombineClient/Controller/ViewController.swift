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
        
        let inputedId = textField.publisher(for: \.text).compactMap { $0.flatMap(Int.init) }.eraseToAnyPublisher()
        
        viewModel = ViewModel(apiClient: APIClient(), inputIdPublisher: inputedId)
        
            viewModel?.character
            .map { characrer in
                characrer.description
            }
            .catch { error in
                Empty<String, Never>()
            }
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] text in
                        self?.characterLabel.text = text
                    })
            .store(in: &subscriptions)
                    
                    
                    
            viewModel?.location
            .map { location in
                        location.description
                    }
            .catch { error in
                        Empty<String, Never>()
                    }
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] text in
                        self?.locationLabel.text = text
                    })
            .store(in: &subscriptions)
                    
            viewModel?.episode
            .map { episode in
                        episode.description
                    }
            .catch { error in
                        Empty<String, Never>()
                    }
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] text in
                        self?.episodeLabel.text = text
                    })
            .store(in: &subscriptions)
                    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(resing))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func resing() {
        view.endEditing(true)
        resignFirstResponder()
    }
}

