//
//  ListViewController.swift
//  VoiceOver
//
//  Created by John Brayton on 1/11/23.
//

import UIKit

class ListViewController : UITableViewController {
    
    let cellIdentifier = "cell"
    
    weak var myNavigationController: MyNavigationController?
    
    init( myNavigationController: MyNavigationController ) {
        self.myNavigationController = myNavigationController
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier)!
        cell.textLabel?.text = String(format: "Row %ld", indexPath.row + 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My section title"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.myNavigationController?.showWebViewController()
    }
    
}
