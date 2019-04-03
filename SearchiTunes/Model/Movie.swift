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
    let trackId: Int
    let trackName: String
    let trackGenre: String
    let trackPrice: Int?
    //var trackImage: Thumbnail //TODO: thumbnail: mapp url from json
    let longDescription: String
    
    init(trackId: Int, trackName: String, trackGenre: String, trackPrice: Int?, /*trackImage: Thumbnail,*/ longDescription: String)
    {
        self.trackId = trackId
        self.trackName = trackName
        self.trackGenre = trackGenre
        self.trackPrice = trackPrice ?? 0
        self.longDescription = longDescription
        //self.trackImage = trackImage //TODO: thumbnail: mapp url from json
    }
    
    private enum MovieCodingKeys: String, CodingKey
    {
        case trackId
        case trackName
        case trackGenre = "primaryGenreName"
        case trackPrice
        //case trackImage
        case longDescription
    }
    
    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        trackId = try container.decode(Int.self, forKey: .trackId)
        trackName = try container.decode(String.self, forKey: .trackName)
        trackGenre = try container.decode(String.self, forKey: .trackGenre)
        trackPrice = try container.decode(Int?.self, forKey: .trackPrice)
        longDescription = try container.decode(String.self, forKey: .longDescription)
    }
}

struct MovieResults
{
    let resultCount: Int
    let movieResults: [Movie]
}

extension MovieResults: Codable
{
    private enum MovieResultsCodingKeys: String, CodingKey
    {
        case resultCount
        case movieResults = "results"
    }
    
    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: MovieResultsCodingKeys.self)
        resultCount = try container.decode(Int.self, forKey: .resultCount)
        movieResults = try container.decode([Movie].self, forKey: .movieResults)
    }
}
//extension Movie
//{
//    private enum CodingKeys: String, CodingKeys
//    {
//        case trackId
//        case trackName
//        case trackGenre = "primaryGenreName"
//        case trackPrice
//        //case trackImage
//        case longDescription
//    }
//}

//TODO: thumbnail: mapp url from json
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
