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
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
    }
}

extension SignUpViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileView: ProfileVIew =  ProfileVIew()
        return profileView
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
