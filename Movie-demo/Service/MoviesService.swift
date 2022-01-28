//
//  MoviesService.swift
//  Movie-demo
//
//  Created by BOICOMP21070028 on 13/1/2565 BE.
//

import Foundation
import Alamofire

protocol MoviesServiceList{
    func onSuccessMovieList(_ model: [MovieModel])
}

class MoviesService{
    var delegate: MoviesServiceList?
    func moviesList(){
        AF.request("https://jsonkeeper.com/b/9E54#").validate().responseJSON{ response in
            switch response.result{
            case .success(let data):
                do {
                    var list = [MovieModel]()
                    if let objJson = (data as? NSArray){
                        for element in objJson {
                            let item = element as! NSDictionary
                            list.append(MovieModel(jsonDic: item))
                        }
                    }
                    self.delegate?.onSuccessMovieList(list)
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
