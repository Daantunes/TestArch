import Foundation
import SwiftUI

struct HobbyRepository {
    var hobbies: [Hobby] = []

    let hobbyService: HobbyService

    init(hobbyService: HobbyService) {
        self.hobbyService = hobbyService
        hobbies = [
            Hobby(name: "Dance", difficulty: .easy),
            Hobby(name: "Photography", difficulty: .easy),
            Hobby(name: "Running", difficulty: .easy)
        ]
    }

    func getHobbies() -> [Hobby] {
        hobbies
    }
}
