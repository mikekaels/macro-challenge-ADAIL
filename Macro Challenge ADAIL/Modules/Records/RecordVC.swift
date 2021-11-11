//
//  RecordVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/10/21.
//

import UIKit

class RecordVC: UIViewController {
    var presentor: RecordViewToPresenterProtocol?
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = Constants().tab2Title
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = UITableView()
//    {
//        var table = UITableView()
//        table.frame = RecordVC().view.frame
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "recordCell")
//        return table
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupView() {
        self.view.backgroundColor = .systemBackground
        self.title = Constants().tab2Title
        self.view.addSubview(textLabel)
        tableView.separatorStyle = .none
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        tableSetup()
        
    }
    
    func tableSetup() {
        tableView.frame = self.view.frame
        tableView.register(RecordsTableViewCell.self, forCellReuseIdentifier: "recordCell")
        self.view.addSubview(tableView)
    }
    
}

extension RecordVC: RecordPresenterToViewProtocol {
    
}

extension RecordVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
             case 0: return "2 Oktober 2021"
             case 1: return "28 September 2021"
             default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        cell.layer.borderWidth = 0
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
