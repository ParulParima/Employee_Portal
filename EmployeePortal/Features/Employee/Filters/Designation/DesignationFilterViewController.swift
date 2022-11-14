//
//  DesignationFilterViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class DesignationFilterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    var viewModel: DesignationFilterViewModel!
    var delegate: FilterByDelegate?
    
    init(viewModel: DesignationFilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DesignationFilterViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInterface()
    }
    
    func setupInterface() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
        self.tableView.register(DesignationTableViewCell.nib(), forCellReuseIdentifier: DesignationTableViewCell.identifier)
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func selectedDesignation(designation: String) {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.delegate?.filterByDesignation(designation: designation)
        }
    }
    
    @IBAction func crossButtonTapped(_ sender: Any) {
        self.dismiss(animated: false)
    }
}
extension DesignationFilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.designation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DesignationTableViewCell.identifier, for: indexPath) as! DesignationTableViewCell
        cell.designation.text = viewModel.designation[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension DesignationFilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDesignation(designation: viewModel.designation[indexPath.row])
    }
}
