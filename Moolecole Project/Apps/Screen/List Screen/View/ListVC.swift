//
//  ListVC.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 11/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON

class ListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listModels = [ListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        
        self.listWeatherAPI()
    }
    
    private func setTableView() {
        let nib = UINib(nibName: "ListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ListCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func listWeatherAPI() {
        Alamofire.request("https://private-96b3f-testing819.apiary-mock.com/mobile/get_user").responseJSON{ response in
            
            let json = JSON(response.result.value!)
            
            for i in 0 ..< json["data"]["result"].count{
                
                let description = json["data"]["result"][i]["description"].string!
                let image_attachment = json["data"]["result"][i]["image_attachment"].string!
                
                self.listModels.append(ListModel(description, image_attachment))
            }
            
            self.tableView.reloadData()
            
        }
    }
}

extension ListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        let song = listModels[indexPath.row]
        cell.setDataToCell(song)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
