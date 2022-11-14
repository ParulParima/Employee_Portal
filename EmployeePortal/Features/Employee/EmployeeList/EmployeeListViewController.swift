//
//  EmployeeListViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

protocol SortByDelegate {
    func sortByNameAscending()
    func sortByNameDescending()
    func sortBySalaryLowToHigh()
    func sortBySalaryHighToLow()
    func sortByHiringOldToNew()
    func sortByHiringNewToOld()
}

protocol FilterByDelegate {
    func filterBySalary(salary: String)
    func filterByDesignation(designation: String)
}

class EmployeeListViewController: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var filterByButton: UIButton!
    @IBOutlet weak var sortByButton: UIButton!
    @IBOutlet weak var employeeListTableView: UITableView!
    
    var viewModel: EmployeeListViewModel!
    weak var navigator: FeaturesCoordinator?
    var navigateBackClosure: (() -> Void)!
    
    var sortedData: [ResultEntity] = []
    var flag = 0
    
    init(viewModel: EmployeeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "EmployeeListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        viewModel.fetchEmployeeData  {
            DispatchQueue.main.async {
                self.employeeListTableView.reloadData()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    func setupInterface() {
        self.employeeListTableView.dataSource = self
        self.employeeListTableView.delegate = self
        self.employeeListTableView.showsVerticalScrollIndicator = false
        self.employeeListTableView.separatorStyle = .none

        self.employeeListTableView.register(EmployeeTableViewCell.nib(), forCellReuseIdentifier: EmployeeTableViewCell.identifier)
        
        self.filterByButton.clipsToBounds = false
        self.filterByButton.layer.cornerRadius = 8
        self.sortByButton.clipsToBounds = false
        self.sortByButton.layer.cornerRadius = 8
        self.logOutButton.clipsToBounds = false
        self.logOutButton.layer.cornerRadius = 8
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        AppUserDefaults.shared.accessToken = nil
        self.navigateBackClosure()
    }
    
    @IBAction func sortByButtonTapped(_ sender: Any) {
        self.navigator?.showSortByScene(delegate: self)
    }
    
    @IBAction func filterByButtonTapped(_ sender: Any) {
        let designation = (self.viewModel.employeeData).compactMap { $0.designation }
        self.navigator?.showFilterByScene(designation: Array(Set(designation)), delegate: self)
    }
}

extension EmployeeListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return flag == 0 ? viewModel.count : sortedData.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as! EmployeeTableViewCell
        if flag == 0 {
            cell.setup(employeeDetails: viewModel.employeeData[indexPath.section])
        }
        else {
            cell.setup(employeeDetails: sortedData[indexPath.section])
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
       }
       
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }

}

extension EmployeeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if flag == 0 {
            self.navigator?.showEmployeeDetails(employeeDetail: viewModel.employeeData[indexPath.section])
        }
        else {
            self.navigator?.showEmployeeDetails(employeeDetail: sortedData[indexPath.section])
        }
    }
}

extension EmployeeListViewController : SortByDelegate {
    func sortByNameAscending() {
        sortedData = viewModel.employeeData.sorted(by: { $0.firstName < $1.firstName })
        flag = 1
        employeeListTableView.reloadData()
    }
    
    func sortByNameDescending() {
        sortedData = viewModel.employeeData.sorted(by: { $0.firstName > $1.firstName })
        flag = 1
        employeeListTableView.reloadData()
    }
    
    func sortBySalaryLowToHigh() {
        sortedData = viewModel.employeeData.sorted(by: { $0.salary < $1.salary })
        flag = 1
        employeeListTableView.reloadData()
    }
    
    func sortBySalaryHighToLow() {
        sortedData = viewModel.employeeData.sorted(by: { $0.salary > $1.salary })
        flag = 1
        employeeListTableView.reloadData()
    }
    
    func sortByHiringOldToNew() {
        sortedData = viewModel.employeeData.sorted(by: {$0.hireDate.compare($1.hireDate, options: .numeric) == .orderedAscending} )
        flag = 1
        employeeListTableView.reloadData()
    }
    
    func sortByHiringNewToOld() {
        sortedData = viewModel.employeeData.sorted(by: {$0.hireDate.compare($1.hireDate, options: .numeric) == .orderedAscending} )
        flag = 1
        employeeListTableView.reloadData()
    }
}

extension EmployeeListViewController: FilterByDelegate {
    func filterBySalary(salary: String) {
        if salary == "All" {
            sortedData = viewModel.employeeData
        }
        else if salary == "Below 0.5 lacs" {
            sortedData = viewModel.employeeData.filter { Float($0.salary)! < 50000}
            flag = 1
        }
        else if salary == "0.5 lacs - 1.5 lacs" {
            sortedData = viewModel.employeeData.filter { Float($0.salary)! >= 50000 && Float($0.salary)! < 150000 }
            flag = 1
        }
        else if salary == "1.5 lacs - 3 lacs" {
            sortedData = viewModel.employeeData.filter { Float($0.salary)! >= 150000 && Float($0.salary)! < 300000 }
            flag = 1
        }
        else if salary == "3 lacs - 8 lacs" {
            sortedData = viewModel.employeeData.filter { Float($0.salary)! >= 300000 && Float($0.salary)! < 800000}
            flag = 1
        }
        else {
            sortedData = viewModel.employeeData.filter { Float($0.salary)! > 800000 }
            flag = 1
            
        }
        employeeListTableView.reloadData()
        
    }
    
    func filterByDesignation(designation: String) {
        if designation == "All" {
            sortedData = viewModel.employeeData
        }
        else {
            sortedData = viewModel.employeeData.filter { $0.designation == designation }
            flag = 1
        }
        employeeListTableView.reloadData()
    }
    
    
}
