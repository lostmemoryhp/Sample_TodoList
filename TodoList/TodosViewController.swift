//
//  TodosViewController.swift
//  TodoList
//
//  Created by 廖海平 on 16/7/1.
//  Copyright © 2016年 廖海平. All rights reserved.
//

import Foundation
import UIKit
import Cartography
import MGSwipeTableCell

class TodosViewController: UIViewController {
    private let tableView = UITableView()
    private let addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layoutView()
        style()
    }
}

//MARK: setup 
private extension TodosViewController{
    func setup(){
        title = "Todos"
        view.backgroundColor = UIColor.grayColor()
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        view.addSubview(tableView)
        
        addButton.addTarget(self, action: "addTodoButtonPressd:", forControlEvents: .TouchUpInside)
        view.addSubview(addButton)
        
    }
}

//MARK: Layout
private extension TodosViewController{
    func layoutView(){
        
        constrain(tableView) { (view) -> () in
            view.top == view.superview!.top
            view.bottom == view.superview!.bottom
            view.left == view.superview!.left
            view.right == view.superview!.right
            
        }
        
        constrain(addButton) { (view) -> () in
            view.bottom == view.superview!.bottom - 5
            view.centerX == view.superview!.centerX
            view.width == view.height
            view.height == 60
        }
        
    }
}

//MARK: style
private extension TodosViewController{
    func style(){
        view.backgroundColor = UIColor.whiteColor()
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal)
    }
}


//MARK: tableview datasource
extension TodosViewController:UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.selectionStyle = .None
        cell.textLabel?.font = UIFont.latoLightFontOfSize(14)
        cell.textLabel?.text = "Todo Number \(indexPath.row)"
        return cell
    }
}
























