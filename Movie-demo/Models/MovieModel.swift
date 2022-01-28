//
//  MovieModel.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 13/1/2565 BE.
//

import Foundation

struct MovieModel {
    var type: String
    var title: String
    var size: String
    var movies: [MovieItemModel]
    init(jsonDic: NSDictionary){
        self.type = jsonDic["type"] as? String ?? ""
        self.title = jsonDic["title"] as? String ?? ""
        self.size = jsonDic["size"] as? String ?? ""
        movies = []
        if jsonDic["movies"] != nil {
            let data = (jsonDic["movies"] as? NSArray)
            for element in data! {
                let item = element as! NSDictionary
                movies.append(MovieItemModel(jsonDic: item))
            }
        }
    }
}

struct MovieItemModel {
    var title: String
    var name: String
    var imageUrl: String
    var description: String
    var category = [String]()
    var language: [String]?
    var startDate: String?

    init(jsonDic: NSDictionary){
        self.title = jsonDic["title"] as? String ?? ""
        self.name = jsonDic["name"] as? String ?? ""
        self.imageUrl = jsonDic["imageUrl"] as? String ?? ""
        self.description = jsonDic["description"] as? String ?? ""
        self.startDate = jsonDic["startDate"] as? String
        
        var cateTemp:[String] = []
        if jsonDic["category"] != nil {
            let data = (jsonDic["category"] as? NSArray)
            for element in data! {
                let item = element as! String
                cateTemp.append(item)
            }
            self.category = cateTemp
        }
        
        var langTemp:[String] = []
        if jsonDic["language"] != nil {
            let data = (jsonDic["language"] as? NSArray)
            for element in data! {
                let item = element as! String
                langTemp.append(item)
            }
            self.language = langTemp
        }
    }
}
