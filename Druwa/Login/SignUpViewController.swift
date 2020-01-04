//
//  SignUpViewController.swift
//  Druwa
//
//  Created by leeyang on 25/12/2019.
//  Copyright © 2019 leeyang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let placeholderArray: [String] = ["아이디를 입력하세요", "비밀번호릴 입력하세요", "닉네임을 입력하세요", "핸드폰번호를 입력하세요"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationFromTableView()
    }
    
    func configurationFromTableView() {
        let headerView: ProfileVIew =  ProfileVIew()
        tableView.tableHeaderView = headerView
        let footerView: ButtonView = ButtonView()
        footerView.button.addTarget(self, action: #selector(pressedSignUpButton(_:)), for: .touchUpInside)
        tableView.tableFooterView = footerView
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let headerView = tableView.tableHeaderView {
            var headerFrame = headerView.frame
            headerFrame.size.height = 60.0
            headerView.frame = headerFrame
            tableView.tableHeaderView = headerView
        }
        
        if let footerView = tableView.tableFooterView {
           var footerFrame = footerView.frame
           footerFrame.size.height = 60.0
           footerView.frame = footerFrame
           tableView.tableFooterView = footerView
        }
    }
    
    @objc func pressedSignUpButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainViewController: MainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            let appdelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window?.rootViewController = mainViewController
        }
    }
}

extension SignUpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SignUpViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell") as? TextFieldCell else {
            return UITableViewCell()
        }
        cell.placeholder = placeholderArray[indexPath.row]
        return cell
    }
}
