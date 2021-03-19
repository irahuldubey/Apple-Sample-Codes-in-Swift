//
//  APIClient.swift
//  Binding
//
//  Created by Rahul Dubey on 3/18/21.
//

import Foundation

class APIClient {
    
    init() { }
    
    static func callWebService(completionHandler: (Result<ResultModel, Error>) -> Void) {
        let result = ResultModel.init(trackName: "A", primaryGenreName: "A", averageUserRating: 9.0, screenshotUrls: ["URL"], artworkUrl100: "j", description: "sss", releaseNotes: "sss")
        //let jsonDecoder = JSONDecoder()
        //jsonDecoder.decode(ResultModel.self, from: data)
        completionHandler(.success(result))
    }
}
