//
//  ViewController.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 12/1/2565 BE.
//

import UIKit
import Alamofire

class ViewController: UIViewController, MoviesServiceList {
    
    @IBOutlet var tableView: UITableView!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var list = [MovieModel]()
    var service = MoviesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Dashboard"
        service.delegate = self
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        tableView.delegate = self
        tableView.dataSource = self
        service.moviesList()
    }
    
    func onSuccessMovieList(_ model: [MovieModel]) {
        DispatchQueue.main.async {
            self.list = model
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item:MovieModel = list[indexPath.row]
        
        if(item.type == "rotate"){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableRotateViewCell.indentify, for: indexPath) as? TableRotateViewCell
            cell!.movieItem = item.movies
            cell!.selectionStyle = .none
//            cell?.collectionRotateView.reloadData()
            cell?.delegate = self
            return cell!
        
        }else if(item.type == "title" && item.size == "medium"){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableMediumViewCell.indentify, for: indexPath) as? TableMediumViewCell
            cell!.movieItem = item.movies
            cell!.title.text = item.title
            cell!.selectionStyle = .none
            cell?.delegate = self
            return cell!
            
        }else if(item.type == "title" && item.size == "small"){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableSmallViewCell.indentify, for: indexPath) as? TableSmallViewCell
            cell!.movieItem = item.movies
            cell!.title.text = item.title
            cell!.selectionStyle = .none
            cell?.delegate = self
            return cell!
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.width
        let hight = UIScreen.main.bounds.height / 3.5
        let item:MovieModel = list[indexPath.row]
        if(item.size == "medium"){
            let widthItem = (width / 2.5) * 0.75 + 5.0
            return widthItem + 35
        }else if(item.size == "small"){
            return hight
        }
        return width * 2/3
    }
    
    func getCellHeight(indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension ViewController: TableRotateViewCellDelegate, TableMediumViewCellDelegate, TableSmallViewCellDelegate{
    func onSelectItemCell(_ item: MovieItemModel) {
        print(item.title)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "scene_detail") as! ViewDetailPageController
        vc.item = item
        navigationController?.pushViewController(vc , animated: true)
    }
}
