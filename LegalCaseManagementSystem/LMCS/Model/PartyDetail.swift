
import Foundation

struct PartyDetails: Codable {
    var documentID: String?
    let partyName: String
    let dateOfBirth: String
    let gender: String
    let ssn: String
    let caseType: String
    let numberOfConvictedFelonies: Int
    let defendantOrPlaintiff: String
    let educationalLevel: String
    let employmentStatus: String
    let userId: String
    let userPhone: String
    let userEmail: String

    enum CodingKeys: String, CodingKey {
        case documentID
        case partyName
        case dateOfBirth
        case gender
        case ssn
        case caseType
        case numberOfConvictedFelonies
        case defendantOrPlaintiff
        case educationalLevel
        case employmentStatus
        case userId
        case userPhone
        case userEmail
    }
}
