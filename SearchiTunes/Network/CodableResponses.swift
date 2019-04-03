//
//  CodableResponses.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 03/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation

struct ITunesResponse<T: Codable>: Codable {
    let data: ITunesSearchResults<T>
}

struct ITunesSearchResults<T: Codable>: Codable {
    let results: [T]
}

