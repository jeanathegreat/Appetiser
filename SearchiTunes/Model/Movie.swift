//
//  Movie.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 02/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation
import UIKit

//MARK: Movie objecto to map data received from JSON object
struct Movie: Codable
{
    //MARK: Movie ID
    public var id: Int
    //MARK: Movie title
    public var name: String
    //MARK: Movie genre
    public var genre: String
    //MARK: Movie price
    public var price: Double?
    //MARK: Long description
    public var description: String
    //MARK: Movie image URL
    public var imageURL: String?
    
    // MARK: For decoding JSON object
    private enum CodingKeys: String, CodingKey
    {
        case id = "trackId"
        case name = "trackName"
        case genre = "primaryGenreName"
        case price = "trackPrice"
        case description = "longDescription"
        case imageURL = "artworkUrl100"
    }
}
