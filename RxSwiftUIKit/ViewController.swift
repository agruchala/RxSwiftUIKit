//
//  ViewController.swift
//  RxSwiftUIKit
//
//  Created by Artur Gruchała on 29/12/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let simpleInput = UITextField()
    private let simpleButton = UIButton(type: .system)
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRx()
    }
    
    private func setupUI() {
        view.addSubview(simpleInput)
        view.addSubview(simpleButton)
        simpleInput.translatesAutoresizingMaskIntoConstraints = false
        simpleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            simpleInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            simpleInput.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            simpleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            simpleButton.topAnchor.constraint(equalTo: simpleInput.bottomAnchor, constant: 10)
            
        ])
        simpleInput.placeholder = "Play With Me"
    }
    
    private func setupRx() {
        simpleInput.rx.text
            .bind(to: simpleButton.rx.title())
            .disposed(by: disposeBag)
    }
}

