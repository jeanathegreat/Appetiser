//
//  Movie.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 02/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation
import UIKit

struct Movie: Decodable
{
    let trackId: Int
    let trackName: String
    let trackGenre: String?
    let trackPrice: Double?
    let longDescription: String
    
    private enum MovieCodingKeys: String, CodingKey
    {
        case trackId
        case trackName
        case trackGenre = "primaryGenreName"
        case trackPrice
        //case trackImage
        case longDescription
    }

}

struct MovieResults
{
    let resultCount: Int
    let movieResults: [Movie]
}
