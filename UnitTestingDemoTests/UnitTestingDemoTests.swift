//
//  UnitTestingDemoTests.swift
//  UnitTestingDemoTests
//
//  Created by Prashant Gaikwad on 13/09/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import XCTest

@testable import UnitTestingDemo

class UnitTestingDemoTests: XCTestCase {

    var waterPokemon:Pokemon!
    var firePokemon:Pokemon!
    var electricPokemon:Pokemon!
    var normalPokemon: Pokemon!
    
    var user:User!
    
    override func setUp() {
        waterPokemon = Pokemon(type: .Water, attackType: .Water)
        firePokemon = Pokemon(type: .Fire, attackType: .Fire)
        electricPokemon = Pokemon(type: .Electric, attackType: .Electric)
        normalPokemon = Pokemon(type: .Neutral, attackType: .Normal)
        
        user = User(name1:"Prashant",age1:30)
    }
    
    
    override func tearDown() {
        waterPokemon = nil
        firePokemon = nil
        electricPokemon = nil
        
        user = nil
    }
    
    func testUserNameAndAge() {
        let akash = User(name1: "akash", age1: 28)
        XCTAssertEqual(akash.name, "akash")
        XCTAssertEqual(akash.age, 28)
    }
    
    func testAttack() {
        electricPokemon.attackBy(attackerPokemon: normalPokemon)
        let result1 = normalPokemon.health < electricPokemon.health
        XCTAssertTrue(result1)
    }
    
    func testAttacker2() {
        waterPokemon.attackBy(attackerPokemon: normalPokemon)
        let result1 = normalPokemon.health < waterPokemon.health
        XCTAssertTrue(result1)
    }
    
    
    func testAsync1() {
        
        let myExpectation = self.expectation(description: "Server reponds in time")
        
        let url = URL(string: "wewewewe")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            myExpectation.fulfill()
            XCTAssertNil(data)
           
        }.resume()
        
        waitForExpectations(timeout: 4)
    }
    
    
    func testAsync2() {
        
        let myExpectation = self.expectation(description: "Server reponds in time")
        defer { waitForExpectations(timeout: 4) }
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { myExpectation.fulfill() }
            
            XCTAssertNil(error)
            
            do {
                let response = try XCTUnwrap(response as? HTTPURLResponse)
                XCTAssertEqual(response.statusCode, 200)
                
                let data = try XCTUnwrap(data)
                XCTAssertNoThrow(
                    try JSONDecoder().decode([Users].self, from: data)
                )
            }catch{}
           
        }.resume()
    }
    
    func testAsync3() {
        
        let myExpectation = self.expectation(description: "Server reponds in time")
        defer { waitForExpectations(timeout: 4) }
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/employees")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { myExpectation.fulfill() }
            
            XCTAssertNil(error)
            
            do {
                let response = try XCTUnwrap(response as? HTTPURLResponse)
                XCTAssertEqual(response.statusCode, 404)
                
                let data = try XCTUnwrap(data)
                
                XCTAssertThrowsError(
                    try JSONDecoder().decode([Users].self, from: data)
                ){ error in
                    guard case DecodingError.typeMismatch = error else {
                        XCTFail("\(error)")
                        return
                    }
                }
                
            }catch{}
           
        }.resume()
        
        
    }
}

//https://jsonplaceholder.typicode.com/users
// Why Unit Testing -
/*
 1. Automate your testing
 2. Ensures that you dont forget to run a test
 3. Helps to prevent bugs and regression
 4. Provides to optimize the code
 5. Tests are documentation for developers
 */
