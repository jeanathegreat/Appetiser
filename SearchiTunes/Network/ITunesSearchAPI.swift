//
//  ITunesSearchAPI.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 03/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import Foundation
import Moya

// https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie

// MARK: Moya network implementation for search request to iTunes Search API
public enum ITunesSearchAPI
{
    case search(term: String, country: String, media: String)
}


extension ITunesSearchAPI: TargetType
{
    public var baseURL: URL
    {
        return URL(string: "https://itunes.apple.com")!
    }
    
    public var path: String
    {
        switch self {
        case .search(_, _, _): return "/search"
        }
    }
    
    public var method: Moya.Method
    {
        switch self{
        case .search: return .get
        }
    }
    
    public var sampleData: Data
    {
        return Data()
    }
    
    public var task: Task
    {
        switch self{
        case let .search(searchTerm, searchCountry, searchMedia):
            return .requestParameters(parameters: ["term" : searchTerm,
                                                   "country" : searchCountry,
                                                   "media" : searchMedia], encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
