//
//  Copyright © 2023 xgeeks. All rights reserved.
//

import XCTest
@testable import TestArch

final class LoginViewModelTests: XCTestCase {

    private var userRepository: UserRepositoryMock!
    private var userService: UserService!
    private let userName = "John Doe"
    private let password = "123"

    // MARK: - Life cycle

    override func setUpWithError() throws {
        userService = UserService()
        userRepository = UserRepositoryMock(userService: userService)
    }

    override func tearDownWithError() throws {
    }
}

// MARK: - Tests

extension LoginViewModelTests {
    func test_login_validCredentials() {

        let viewModel = LoginViewModel(userRepository: userRepository)

        viewModel.configuration.username = userName
        viewModel.configuration.password = password

        viewModel.send(.event(.loginButtonTap))

        XCTAssertEqual(userRepository.user?.name, userName)
    }

    func test_login_invalidUsername() {
        let viewModel = LoginViewModel(userRepository: userRepository)

        XCTAssertEqual(viewModel.state, .success(true))

        viewModel.configuration.password = password

        viewModel.send(.event(.loginButtonTap))

        XCTAssertEqual(viewModel.state, .failed(LoginViewModel.LoginError.fail))
    }

    func test_login_invalidPassword() {
        let viewModel = LoginViewModel(userRepository: userRepository)

        XCTAssertEqual(viewModel.state, .success(true))

        viewModel.configuration.username = userName

        viewModel.send(.event(.loginButtonTap))

        XCTAssertEqual(viewModel.state, .failed(LoginViewModel.LoginError.fail))
    }


    func test_tryAgain() {
        let viewModel = LoginViewModel(userRepository: userRepository)

        viewModel.send(.event(.loginButtonTap))

        XCTAssertEqual(viewModel.state, .failed(LoginViewModel.LoginError.fail))

        viewModel.send(.event(.tryAgain))

        XCTAssertEqual(viewModel.state, .success(true))
    }
}
