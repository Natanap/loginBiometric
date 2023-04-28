//
//  File.swift
//  loginBiometric
//
//  Created by Natanael Alves Pereira on 17/04/23.
//

import Foundation

struct UserViewModel {
    var model: UserModel?
    
    init(model: UserModel){
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
}
