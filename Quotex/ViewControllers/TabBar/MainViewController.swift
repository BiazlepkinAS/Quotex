//
//  ViewController.swift
//  Quotex
//
//  Created by Andrei Bezlepkin on 17.03.22.
//

import UIKit

class MainViewController: UINavigationController {
    
    private lazy var cashLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.text = "$ 1,000.00"
        label.textColor = UIColor(red: 15/255, green: 175/255, blue: 89/255, alpha: 1)
        return label
    }()
    
    private lazy var choosenLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "roboto", size: 22)
        label.text = "Chose pair"
        return label
    }()
    
    private lazy var currencyTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .green
        return table
    }()
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
    }
    
    private func prepareUI() {
        
        view.backgroundColor = UIColor(red: 29/255, green: 40/255, blue: 51/255, alpha: 1)
        navigationBar.isHidden = true
        self.modalPresentationStyle = .fullScreen
        
        
        view.addSubview(cashLabel)
        cashLabel.translatesAutoresizingMaskIntoConstraints = false
        cashLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        cashLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 111).isActive = true
        cashLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -111).isActive = true
        cashLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        view.addSubview(choosenLabel)
        choosenLabel.translatesAutoresizingMaskIntoConstraints = false
        choosenLabel.topAnchor.constraint(equalTo: cashLabel.bottomAnchor, constant: 27).isActive = true
        choosenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62).isActive = true
        choosenLabel.centerXAnchor.constraint(equalTo: cashLabel.centerXAnchor).isActive = true
        choosenLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(currencyTableView)
        currencyTableView.translatesAutoresizingMaskIntoConstraints = false
        currencyTableView.topAnchor.constraint(equalTo: choosenLabel.bottomAnchor, constant: 16).isActive = true
        currencyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        currencyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        currencyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        currencyTableView.register(CurrentCell.self, forCellReuseIdentifier: "CurrentCell")
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentCell", for: indexPath) as! CurrentCell
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

