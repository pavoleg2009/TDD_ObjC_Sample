
#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#define OC_SHORTHAND
#import "POSMarvelAuthentication.h"


@interface POSMarvelAuthenticationTest : XCTestCase

@end

@implementation POSMarvelAuthenticationTest

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    [super tearDown];
}

- (void)testTimestamp_ShouldChangeEveryCall {
    NSString *ts1 = [POSMarvelAuthentication timestamp];
    NSString *ts2 = [POSMarvelAuthentication timestamp];
    //XCTAssertNotEqualObjects(ts1, ts2);
    assertThat(ts1, isNot(equalTo(ts2)));
    
}

- (void) testPulicKey_ShouldHave32Characters {
    NSString *key = [POSMarvelAuthentication publicKey];
    assertThat(@(key.length), is(@32));
}


- (void) testPrivateKey_ShouldHave32Characters {
    NSString *key = [POSMarvelAuthentication privateKey];
    assertThat(@(key.length), is(@40));
}

@end
