//
//  CodableResponses.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 03/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation

//MARK: Codable struct to return JSON array called results
struct ITunesSearchResults<T: Codable>: Codable {
    let results: [T]
}
