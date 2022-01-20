//
//  MoviesService.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 13/1/2565 BE.
//

import Foundation
import Alamofire

class MoviesService{
    var list:[MovieModel] = []
    func moviesList(){
        AF.request("https://jsonkeeper.com/b/9E54#").validate().responseJSON{ response in
            switch response.result{
            case .success(let data):
                do {
                    if let objJson = (data as? NSArray){
                        for element in objJson {
                            let item = element as! NSDictionary
                            self.list.append(MovieModel(jsonDic: item))
                        }
                    }
                    for item in self.list{
                        print(item.movies[0].name)
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
