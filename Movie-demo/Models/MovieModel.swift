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
  
    init(jsonDic: Dictionary<String, Any>){
        self.type = jsonDic["type"] as? String ?? ""
        self.title = jsonDic["title"] as? String ?? ""
        self.size = jsonDic["size"] as? String ?? ""
        movies = []
        if jsonDic["movies"] != nil {
            let data = (jsonDic["movies"] as? Array<AnyObject>)
            for element in data! {
                let item = element as! Dictionary<String, Any>
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
    var trailer: TrailerModel?
    var more: MoreModel?

    init(jsonDic: Dictionary<String, Any>){
        self.title = jsonDic["title"] as? String ?? ""
        self.name = jsonDic["name"] as? String ?? ""
        self.imageUrl = jsonDic["imageUrl"] as? String ?? ""
        self.description = jsonDic["description"] as? String ?? ""
        self.startDate = jsonDic["startDate"] as? String
        
        var cateTemp:[String] = []
        if jsonDic["category"] != nil {
            let data = (jsonDic["category"] as? Array<AnyObject>)
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
       
        if let dictTrailer = jsonDic["trailer"] as? Dictionary<String, Any>{
            self.trailer = TrailerModel(jsonDict: dictTrailer)
        }
       
        if let dictMore = jsonDic["more"] as? Dictionary<String, Any> {
            self.more = MoreModel(jsonDict: dictMore)
        }
     }
}

struct TrailerModel{
    var videoUrl:String
    var imageUrl:String
    
    init(jsonDict: Dictionary<String, Any>?){
        self.videoUrl = jsonDict?["videoUrl"] as? String ?? ""
        self.imageUrl = jsonDict?["imageUrl"] as? String ?? ""
    }
}

struct MoreModel{
    var movies = [MovieItemModel]()
    init(jsonDict: Dictionary<String, Any>){
        if jsonDict["movies"] != nil {
            let data = (jsonDict["movies"] as? [AnyObject])
            for element in data! {
                let item = element as! Dictionary<String, Any>
                movies.append(MovieItemModel(jsonDic: item as Dictionary))
            }
        }
    }
}
