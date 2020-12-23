struct BenefitLevel: Decodable {
    let id: CategoryLevel
    let name: String
    let purchases: Int?
    let purchasesExpected: Int
    let purchasesPercent: Double?
    let totalSpent: String?
    let totalSpentExpected: String
    let totalSpentPercent: Double?
    let expirationDate: String?
}

struct BenefitLevels: Decodable {
    let current: BenefitLevel
    let next: BenefitLevel?
}

struct BenefitModel: BenefitHomeModelProtocol, Decodable {
    let levels: BenefitLevels
}

enum CategoryLevel: Int, Decodable {
    case levelOne = 1
    case levelTwo = 2
    case levelThree = 3
    case levelFour = 4
}

protocol BenefitHomeModelProtocol {
    var levels: BenefitLevels { get }
}

struct BenefitHomeModelMock: BenefitHomeModelProtocol {
    var levels: BenefitLevels
}

extension BenefitHomeModelMock {
    static func mockArray() -> [BenefitHomeModelProtocol] {
        return [
            BenefitHomeModelMock(
                levels: BenefitLevels(
                    current: BenefitLevel(
                        id: .levelFour,
                        name: "",
                        purchases: nil,
                        purchasesExpected: 1,
                        purchasesPercent: nil,
                        totalSpent: nil,
                        totalSpentExpected: "",
                        totalSpentPercent: nil,
                        expirationDate: nil
                    ),
                    next: nil
                )
            ),
            BenefitHomeModelMock(
                levels: BenefitLevels(
                    current: BenefitLevel(
                        id: .levelFour,
                        name: "",
                        purchases: nil,
                        purchasesExpected: 1,
                        purchasesPercent: nil,
                        totalSpent: nil,
                        totalSpentExpected: "",
                        totalSpentPercent: nil,
                        expirationDate: nil
                    ),
                    next: nil
                )
            ),
            BenefitHomeModelMock(
                levels: BenefitLevels(
                    current: BenefitLevel(
                        id: .levelFour,
                        name: "",
                        purchases: nil,
                        purchasesExpected: 1,
                        purchasesPercent: nil,
                        totalSpent: "",
                        totalSpentExpected: "",
                        totalSpentPercent: nil,
                        expirationDate: nil
                    ),
                    next: nil
                )
            )
        ]
    }
}


//"levels": {
//  "current": {
//    "id": 2,
//    "name": "2 estrelas",
//    "purchases": 8,
//    "purchasesExpected": 13,
//    "purchasesPercent": 0.6153846153846154,
//    "totalSpent": "1.200,00",
//    "totalSpentExpected": "3.000,01",
//    "totalSpentPercent": 0.39999866667111106,
//    "expirationDate": "11.11.2021"
//  },
//  "next": {
//    "id": 3,
//    "name": "03",
//    "purchasesExpected": 13,
//    "totalSpentExpected": "3.000,01"
//  }
//},
//"reservedBenefits": true
