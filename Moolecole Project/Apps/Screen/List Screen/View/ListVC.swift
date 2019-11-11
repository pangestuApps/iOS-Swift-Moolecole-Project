//
//  ListVC.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 11/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import RxSwift
import RxCocoa

class ListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data : [ListModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        self.setDataDummy()
    }
    
    private func setTableView() {
        let nib = UINib(nibName: "ListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ListCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func setDataDummy() {
//        self.data.append(ListModel)
    }
    
    func setupData(_ model: [ListModel]) {
        self.data = model
        self.tableView.reloadData()
    }
}

extension ListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.data.count
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension Reactive where Base: ListVC {
    var model: Binder<[ListModel]?> {
        return Binder(self.base) { view, model in
            if model != nil{
                view.setupData(model!)
            }
        }
    }
}
