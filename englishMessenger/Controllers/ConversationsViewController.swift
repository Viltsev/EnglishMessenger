//
//  ViewController.swift
//  englishMessenger
//
//  Created by Данила on 15.02.2023.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        
        // кнопка перехода в окно логина
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Exit",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(backLogin))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // пока пользователь не зашел в аккаунт
        validateAuth()
    }
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController() // vc экрана логина
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false) // переход на экран логина
        }
    }
    
    @objc private func backLogin() {
        let vc = LoginViewController()
        vc.title = "Exit"
        
        navigationController?.pushViewController(vc, animated: true)
    }
}


