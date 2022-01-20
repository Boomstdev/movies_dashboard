//
//  ViewController.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 12/1/2565 BE.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var list = [MovieModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Dashboard"
        fetchFilms()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
//        tableView.register(UINib(nibName: "TableRotateViewCell", bundle: nil), forCellReuseIdentifier: TableRotateViewCell.indentify)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
    func fetchFilms() {
        // 1
        AF.request("https://jsonkeeper.com/b/9E54#").validate().responseJSON{ response in
            switch response.result{
            case .success(let data):
               var itemList = [MovieModel]()
                do {
                    if let objJson = (data as? NSArray){
                        for element in objJson {
                            let item = element as! NSDictionary
                            itemList.append(MovieModel(jsonDic: item))
                        }
                    }
                    DispatchQueue.main.async {
                        self.list = itemList
                        self.tableView.reloadData()
                    }
                    
                    for item in self.list{
                        print(item.movies[0].imageUrl)
                    }
                } catch let error {
                    print("JSON DATA: \(error)")
                }
            case .failure(let error):
                print(error)
                return
            }
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
//            cell?.typeText.text = item.type
            
            cell!.movieItem = item.movies
            cell!.selectionStyle = .none
            cell?.collectionRotateView.reloadData()
            return cell!
        
        }else if(item.type == "title" && item.size == "medium"){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableMediumViewCell.indentify, for: indexPath) as? TableMediumViewCell
//            cell?.typeText.text = item.type

            cell!.movieItem = item.movies
            cell!.title.text = item.title
            cell!.selectionStyle = .none
//            cell?.collectionRotateView.reloadData()
            return cell!
        }else if(item.type == "title" && item.size == "small"){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableSmallViewCell.indentify, for: indexPath) as? TableSmallViewCell
//            cell?.typeText.text = item.type

            cell!.movieItem = item.movies
            cell!.title.text = item.title
            cell!.selectionStyle = .none
//            cell?.collectionRotateView.reloadData()
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
//        return getCellHeight(indexPath: indexPath)
    }
    
    func getCellHeight(indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

