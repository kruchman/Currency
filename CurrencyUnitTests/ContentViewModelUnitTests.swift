//
//  CurrencyUnitTests.swift
//  CurrencyUnitTests
//
//  Created by Юрий Кручинин on 24/10/23.
//

import XCTest
@testable import Currency

final class ContentViewModelUnitTests: XCTestCase {
    
    var sut: ContentViewModel!

    override func setUpWithError() throws {
        sut = ContentViewModel(netwokManager: NetworkManager())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
        //MARK: - updateLabel() Function Tests
    
    func testLabelUpdatingWhenBothCurrenciesNotSelected() throws {
        //given
        sut.isfirstCurrencySelected = false
        sut.isSecondCurrencySelected = false
        var expectation: Bool
        //when
            sut.updateLabel()
            expectation = sut.labelOfConvertation == ""
        //than
        XCTAssert(expectation)
    }
    
    func testLabelUpdatingWhenJustFirstCurrencySelected() throws {
        //given
        sut.isfirstCurrencySelected = true
        sut.isSecondCurrencySelected = false
        sut.firstCurrency = "USD"
        var expectation: Bool
        //when
            sut.updateLabel()
            expectation = sut.labelOfConvertation == "\(sut.firstCurrency) to ..."
        //than
        XCTAssert(expectation)
    }
    
    func testLabelUpdatingWhenBothCurrenciesSelected() throws {
        //given
        sut.isfirstCurrencySelected = true
        sut.isSecondCurrencySelected = true
        sut.firstCurrency = "USD"
        sut.secondCurrency = "EUR"
        var expectation: Bool
        //when
            sut.updateLabel()
        expectation = sut.labelOfConvertation == "\(sut.firstCurrency) to \(sut.secondCurrency)"
        //than
        XCTAssert(expectation)
    }
    
    //MARK: - updateLabel() TextField Validation Tests

    func testTextFieldValidationForSigns() {
        //given
        let signs = ["!", "@", "#", "$", "%", "?", ",", "."]
        sut.moneyAmount = signs.randomElement() ?? "+"
        var expectation: Bool
        //when
        sut.convert()
        expectation = sut.labelOfConvertation == "Enter some positive number"
        //than
        XCTAssert(expectation)
    }
    func testTextFieldValidationForLetters() {
        //given
        sut.moneyAmount = String(Character.randomAlphabetCharacter)
        var expectation: Bool
        //when
        sut.convert()
        expectation = sut.labelOfConvertation == "Enter some positive number"
        //than
        XCTAssert(expectation)
    }
    
    func testTextFieldValidationForNegativeNumbersAndZero() {
        //given
        sut.moneyAmount = String([-999, 0].randomElement() ?? -1)
        var expectation: Bool
        //when
        sut.convert()
        expectation = sut.labelOfConvertation == "Enter some positive number"
        //than
        XCTAssert(expectation)
    }
    
    func testTextFieldValidationForPositiveNumber() {
        //given
        sut.moneyAmount = String(9)
        sut.firstCurrency = "USD"
        sut.secondCurrency = "EUR"
        var expectation: Bool
        //when
        sut.convert()
        expectation = !sut.resultOfConvertation.isEmpty
        //than
        XCTAssert(expectation)
    }
    
    //MARK: - Convertation Test
    
    func testOfConvertationMethod() {
        //given
        sut.firstCurrency = "USD"
        sut.secondCurrency = "RUB"
        sut.firstRate = 1
        sut.secondRate = 100
        sut.moneyAmount = "50"
        var expectation: Bool
        //when
        sut.convert()
        expectation = sut.resultOfConvertation == "5000.00"
        //than
        XCTAssert(expectation)
    }
    
    //MARK: - Network Methods Tests
    
    func testForCurrencyRatesExistence() {
        //given
        let mockNetwokManager = MockNetworkManager()
        var mockRates: [String: Double] = [:]
        var expectation: Bool
        //when
        mockNetwokManager.fetchData { result in
            switch result {
            case .success(let rates):
                mockRates = rates
            case .failure(_):
                return
            }
        }
        expectation = !mockRates.isEmpty
        //than
        XCTAssert(expectation)
    }
    
    func testForCurrencyBase() {
        //given
        let mockNetwokManager = MockNetworkManager()
        var mockRates: [String: Double] = [:]
        var expectation: Bool
        //when
        mockNetwokManager.fetchData { result in
            switch result {
            case .success(let rates):
                mockRates = rates
            case .failure(_):
                return
            }
        }
        expectation = mockRates["USD"] == 1
        //than
        XCTAssert(expectation)
    }
    
}
