//
//  EmployeeDetailsViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var empDetailsTableVIew: UITableView!
    
    var viewModel: EmployeeDetailsViewModel!
    weak var navigator: FeaturesCoordinator?
    var navigateBackClosure: (() -> Void)!
    
    init(viewModel: EmployeeDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "EmployeeDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapHandler(sender:)))

        self.imageView.addGestureRecognizer(tapGestureRecognizer)
        self.imageView.isUserInteractionEnabled = true
        setupInterface()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    func setupInterface() {
        
        self.empDetailsTableVIew.dataSource = self
        self.empDetailsTableVIew.separatorStyle = .none
        self.empDetailsTableVIew.showsVerticalScrollIndicator = false
        self.empDetailsTableVIew.register(EmpDetailsTableViewCell.nib(), forCellReuseIdentifier: EmpDetailsTableViewCell.identifier)
        
        self.employeeName.text = viewModel.employeeDetail.firstName.capitalized + " " + viewModel.employeeDetail.lastName.capitalized
        guard let url = URL(string: viewModel.employeeDetail.photo ?? "") else { return }
        if let data = try? Data(contentsOf: url) {
                imageView.image = UIImage(data: data)
            }
    }
    
    @objc func tapHandler(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.navigator?.showProfileFullScreen(image: viewModel.employeeDetail.photo ?? "")
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigateBackClosure()
    }
    
}
extension EmployeeDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeDetail.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmpDetailsTableViewCell.identifier, for: indexPath) as! EmpDetailsTableViewCell
        cell.setup(key: viewModel.key[indexPath.row], value: viewModel.employeeDetail.value[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
