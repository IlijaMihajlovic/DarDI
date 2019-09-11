//
//  NetworkError.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import Foundation

//Possible errors we can encounter
enum NetworkError: Error {
    
    case domainError
    case decodingError
    case responseError
    case encodingError
}
