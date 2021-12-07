//
//  RecordVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/10/21.
//

import UIKit

class RecordVC: UIViewController {
    var presentor: RecordViewToPresenterProtocol?
    
    var dateSections: [String] = [String]()
    var filteredRecords: [[Expanses]] = [[Expanses]]()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = Constants().tab2Title
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = UITableView()
        .configure { v in
            v.backgroundColor = .secondarySystemBackground
        }
    
    var records: [Expanses] = [] {
        didSet {
            print("RELOAD")
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRecords()
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
    
    func fetchRecords() {
        print("FETCHING...")
        presentor?.fetchRecords()
    }
    
}

extension RecordVC: RecordPresenterToViewProtocol {
    func didFetchRecords(expanses: [Expanses]) {
        self.records = expanses
        var records: [Expanses] = []
        var dates: [String] = []
        var recordings: [[Expanses]] = []
        
        expanses.forEach { record in
            let exist = dates.contains(record.paymentDate.toString())
            if !exist {
                dates.append(record.paymentDate.toString())
            }
        }
        
        dates.forEach { date in
            expanses.forEach { record in
                let recordDate = record.paymentDate.toString()
                
                if recordDate == date {
                    records.append(record)
                }
            }
            
            recordings.append(records)
            records.removeAll()
        }
        self.dateSections = dates
        self.filteredRecords = recordings
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension RecordVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredRecords.count
    }
//
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dateSections[section]
    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case section:
                return filteredRecords[section].count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! RecordsTableViewCell
        let record = filteredRecords[indexPath.section][indexPath.row]
        cell.image.image = UIImage(systemName: record.icon)
        cell.titleLabel.text = record.transactionName
        cell.priceLabel.text = String(record.totalTransaction).currencyFormatting()
        cell.layer.borderWidth = 0
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentor?.router?.goToDetailsRecord(from: self)
    }
    
}
