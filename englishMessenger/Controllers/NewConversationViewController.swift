//
//  NewConversationViewController.swift
//  englishMessenger
//
//  Created by Данила on 15.02.2023.
//

import UIKit
import JGProgressHUD


class NewConversationViewController: UIViewController {
    
    private let spinner = JGProgressHUD()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for Users..."
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let noResultsLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = "No Results"
        label.textAlignment = .center
        label.textColor = .green
        label.font = .systemFont(ofSize: 21, weight: .medium)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(dismissSelf))
        // Do any additional setup after loading the view.
        searchBar.becomeFirstResponder()
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

}

extension NewConversationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
}
