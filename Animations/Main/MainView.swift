//
//  ViewController.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 20/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

enum MainFlow: Event {    
    case basic, replacing, tableView, keyframe
}

enum TypeOfMenu: Int {
    case basic = 0
    case replacing, tableView, keyframe
}

class MainView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let menuList = ["Basic", "Replacing", "TableView", "KeyFraming Animation"]
    var coordinator: Coordinator?
    init(coordinator: Coordinator) {
        super.init(nibName: String(describing: MainView.self), bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
}


extension MainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let type = TypeOfMenu(rawValue: indexPath.row) else { return }
        switch type {
        case .basic:
            self.coordinator?.handle(MainFlow.basic)
        case .replacing:
            self.coordinator?.handle(MainFlow.replacing)
        case .keyframe:
            self.coordinator?.handle(MainFlow.keyframe)
        case .tableView:
            self.coordinator?.handle(MainFlow.tableView)
        }
    }
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuList[indexPath.row]
        return cell
    }
}
