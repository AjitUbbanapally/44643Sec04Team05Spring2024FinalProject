

import Foundation

struct UserRegistrationModel {
    var name: String?
    var email: String?
    var dob: String?
    var phone: String?
    var password: String?
    var userType: String?
    var barId: String?

    init(name: String?, email: String?, dob: String?, phone: String?, password: String?, userType: String?, barId: String?) {
        self.name = name
        self.email = email
        self.dob = dob
        self.phone = phone
        self.password = password
        self.userType = userType
        self.barId = barId
    }
}


