//
//  ViewDetailPageController.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 25/1/2565 BE.
//

import UIKit

class ViewDetailPageController: UIViewController {
    
    var item: MovieItemModel!

    @IBOutlet weak var tableDetail: UITableView!
    
    var listCell = ["image","language","date","detail","type"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDetail.delegate = self
        tableDetail.dataSource = self
    }

}

extension ViewDetailPageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentify = listCell[indexPath.row]
        
        if indentify == "image"{
            let cell = tableDetail.dequeueReusableCell(withIdentifier: "cellImage", for: indexPath)
            let image = cell.viewWithTag(10) as! UIImageView
            image.load(url: item.imageUrl)
            cell.selectionStyle = .none
            return cell
        }else if indentify == "language"{
            let cell = tableDetail.dequeueReusableCell(withIdentifier: TableLanguageViewCell.indentify, for: indexPath) as! TableLanguageViewCell
            cell.lbltext.text = "ภาษา"
            cell.languageList = item.language
            cell.selectionStyle = .none
            return cell
        }else if indentify == "date"{
            let cell = tableDetail.dequeueReusableCell(withIdentifier: "cellDate", for: indexPath)
            let lbldate = cell.viewWithTag(10) as! UILabel
            let myDate = dateToString(date:item.startDate!)
            lbldate.text = myDate
            cell.selectionStyle = .none
            return cell
        }else if indentify == "detail"{
            let cell = tableDetail.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath)
            let lblDetail = cell.viewWithTag(11) as! UILabel
            lblDetail.text = item.description
            return cell
        }else if indentify == "type"{
            let cell = tableDetail.dequeueReusableCell(withIdentifier: TableTypeViewCell.indentify, for: indexPath) as! TableTypeViewCell
            cell.typeList = item.category
            let lblType = cell.viewWithTag(10) as! UILabel
            var string = ""
            for x in item.category {
                string += x + "\r\n"
            }
            lblType.text = string
            return cell
        }
        return UITableViewCell()
    }
    
    func dateToString(date:String) -> String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY/MM/dd"
        
        if let dateDouble = Double(date){
            let epocTime = TimeInterval(dateDouble)
            let date = NSDate(timeIntervalSince1970: epocTime)
            let myDate = dateFormat.string(from: date as Date)
            return myDate
        }
        return "Unknow"
    }
    
    
    
}
