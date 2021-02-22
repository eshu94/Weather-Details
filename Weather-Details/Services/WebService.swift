//
//  WebService.swift
//  Weather-Details
//
//  Created by ESHITA on 10/02/21.
//

import Foundation

struct Resource<T> {
    let url: URL
    let responseData: (Data) -> T?
}

class WebService {
    
func load<T> (resource:Resource<T>, completion:@escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url){ data, response, error in
            
            //print(data)
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.responseData(data))
                }
            }else {
                completion(nil)
            }
            
        }.resume()
    }
    
}
