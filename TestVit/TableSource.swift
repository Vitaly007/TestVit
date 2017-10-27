//
//  TableSource.swift
//  TestVit
//
//  Created by Vitaly Asadullin on 11.10.17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation
import UIKit
extension ViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersDataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  Cell = tableView.dequeueReusableCell(withIdentifier: "usersCell") as! usersTableViewCell
        Cell.label1.text = self.usersDataTable[indexPath.row].name
        Cell.label2.text = self.usersDataTable[indexPath.row].username
        Cell.label3.text = self.usersDataTable[indexPath.row].email
        Cell.label4.text = self.usersDataTable[indexPath.row].address
        Cell.label5.text = self.usersDataTable[indexPath.row].phone
        Cell.label6.text = self.usersDataTable[indexPath.row].website
        Cell.label7.text = self.usersDataTable[indexPath.row].companyName
        Cell.label8.text = self.usersDataTable[indexPath.row].catchPhrase
        Cell.label9.text = self.usersDataTable[indexPath.row].bs
//        Cell.updateConstraintsIfNeeded()
//        Cell.setNeedsLayout()
//        Cell.layoutIfNeeded()
//        Cell.updateConstraintsIfNeeded()
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Не выделять строчку при нажатии на нее
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

