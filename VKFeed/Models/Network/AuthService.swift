//
//  authService.swift
//  VKFeed
//
//  Created by Илья on 04.11.2020.
//

import UIKit

class AuthService {
    
    static var shared: AuthService = {
        let authService = AuthService()
        return authService
    }()
    
    let clientId: String
    var accessToken: String?
    let urlSession: URLSession
    
    init() {
        urlSession = URLSession(configuration: .default)
        clientId = ""
    }
    
    func signIn() {
        var url = URLComponents()
        url.scheme = "https"
        url.host = "oauth.vk.com"
        url.path = "/authorize"
        
        var parameters: [String: String] = [:]
        let scope = "wall"
        parameters["client_id"] = clientId
        parameters["redirect_uri"] = "https://oauth.vk.com/blank.html"
        parameters["display"] = "mobile"
        parameters["scope"] = scope
        parameters["response_type"] = "token"
        url.queryItems = parameters.map({ (key, value) in
            return URLQueryItem(name: key, value: value)
        })
        print(url.url)
    }
}

extension AuthService: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
