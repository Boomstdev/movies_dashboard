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
        
        if item.trailer != nil{
            listCell.append("trailer")
        }
        if item.more != nil{
            listCell.append("more")
        }
        tableDetail.reloadData()
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
            var string = ""
            for x in item.category {
                string += x + "\r\n"
            }
            cell.lblText.text = string
            return cell
        }else if indentify == "trailer"{
            let cell = tableDetail.dequeueReusableCell(withIdentifier: "cellTrailer", for: indexPath)
            let title = cell.viewWithTag(10) as! UILabel
            title.text = "Traillers"
            let image = cell.viewWithTag(11) as! UIImageView
            if let trailer = item.trailer{
                image.load(url: trailer.imageUrl)
            }
            let lblText = cell.viewWithTag(12) as! UILabel
            lblText.text = item.name
            lblText.layer.borderWidth = 1
            lblText.layer.borderColor = UIColor.gray.cgColor
            lblText.layer.cornerRadius = 5
            let viewLaout = cell.viewWithTag(13)
            viewLaout?.layer.borderWidth = 1
            viewLaout?.layer.borderColor = UIColor.gray.cgColor
            viewLaout?.layer.cornerRadius = 5
            return cell
        }else if indentify == "more"{
            let cell = tableDetail.dequeueReusableCell(withIdentifier: "cellMore", for: indexPath) as! TableSmallViewCell
            if let movieList = item.more{
                cell.movieItem = movieList.movies
            }
            cell.collectionSmallView.reloadData()
            cell.title.text = "More Like This"
            cell.selectionStyle = .none
//            cell.delegate = self
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let indentify = listCell[indexPath.row]
        let width = UIScreen.main.bounds.width
        let hight = UIScreen.main.bounds.height / 3.5
//        let item:MovieModel = list[indexPath.row]
        
        if indentify == "more"{
            return hight
        }
        
        return getCellHeight(indexPath: indexPath)
    }
    
    func getCellHeight(indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
