//
//  TDDSampleApp_AcceptanceTests.m
//  TDDSampleApp_AcceptanceTests
//
//  Created by Oleg Pavlichenkov on 20/04/2017.
//  Copyright © 2017 Oleg Pavlichenkov. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TDDSampleApp_AcceptanceTests : XCTestCase

@end

@implementation TDDSampleApp_AcceptanceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    XCTFail(@"acceptance");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
