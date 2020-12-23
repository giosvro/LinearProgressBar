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
                        name: <#T##String#>,
                        purchases: <#T##Int?#>,
                        purchasesExpected: <#T##Int#>,
                        purchasesPercent: <#T##Double?#>,
                        totalSpent: <#T##String?#>,
                        totalSpentExpected: <#T##String#>,
                        totalSpentPercent: <#T##Double?#>,
                        expirationDate: <#T##String?#>
                    ),
                    next: nil
                )
            ),
            BenefitHomeModelMock(
                levels: BenefitLevels(
                    current: BenefitLevel(
                        id: <#T##CategoryLevel#>,
                        name: <#T##String#>,
                        purchases: <#T##Int?#>,
                        purchasesExpected: <#T##Int#>,
                        purchasesPercent: <#T##Double?#>,
                        totalSpent: <#T##String?#>,
                        totalSpentExpected: <#T##String#>,
                        totalSpentPercent: <#T##Double?#>,
                        expirationDate: <#T##String?#>
                    ),
                    next: nil
                )
            ),
            BenefitHomeModelMock(
                levels: BenefitLevels(
                    current: BenefitLevel(
                        id: <#T##CategoryLevel#>,
                        name: <#T##String#>,
                        purchases: <#T##Int?#>,
                        purchasesExpected: <#T##Int#>,
                        purchasesPercent: <#T##Double?#>,
                        totalSpent: <#T##String?#>,
                        totalSpentExpected: <#T##String#>,
                        totalSpentPercent: <#T##Double?#>,
                        expirationDate: <#T##String?#>
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
