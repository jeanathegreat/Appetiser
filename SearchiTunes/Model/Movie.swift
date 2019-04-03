//
//  Movie.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 02/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation
import UIKit

struct Movie: Codable
{
    var trackId: Int
    var trackName: String
    var trackGenre: String
    var trackPrice: Int
    //var trackImage: Thumbnail
    var longDescription: String
    
    init(trackId: Int, trackName: String, trackGenre: String, trackPrice: Int, /* trackImage: Thumbnail, */ longDescription: String)
    {
        self.trackId = trackId
        self.trackName = trackName
        self.trackGenre = trackGenre
        self.trackPrice = trackPrice
        self.longDescription = longDescription
        //self.trackImage = trackImage
    }
}

//extension Movie {
//    struct Thumbnail: Codable {
//        let path: String
//        let `extension`: String
//        
//        var url: URL {
//            return URL(string: path + "." + `extension`)!
//        }
//    }
//}
