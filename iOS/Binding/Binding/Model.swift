//
//  Model.swift
//  Binding
//
//  Created by Rahul Dubey on 3/18/21.
//

import Foundation

struct ResultModel: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
    let description: String
    let releaseNotes: String
}
