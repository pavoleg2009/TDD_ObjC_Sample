
#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
//#define OC_SHORTHAND
#import "POSMarvelAuthentication.h"


@interface POSMarvelAuthenticationTest : XCTestCase

@end

//@interface TestMarvelAuthentication: POSMarvelAuthentication
//@end
//
//@implementation TestMarvelAuthentication
//
//- (NSString *) MD5OfString:(NSString *)str {
//    return [NSString stringWithFormat:@"MD5%@MD5", str];
//}
//
//@end

@implementation POSMarvelAuthenticationTest
{
    POSMarvelAuthentication *sut;
}

- (void)setUp {
    [super setUp];
    sut = [[POSMarvelAuthentication alloc] init];
}

- (void)tearDown {
    sut = nil;
    [super tearDown];
}

- (void)testTimestamp_ShouldChangeAcrossDifferentIndstance {
    
    NSString *ts1 = sut.timestamp;
    NSString *ts2 = [[POSMarvelAuthentication alloc] init].timestamp;
    //XCTAssertNotEqualObjects(ts1, ts2);
    assertThat(ts1, isNot(equalTo(ts2)));
    
}

- (void)testTimestamp_ShouldNotChangeOnSameInstance {
    
    NSString *ts1 = [sut timestamp];
    NSString *ts2 = [sut timestamp];
    
    assertThat(ts1, equalTo(ts2));
}

- (void) testPulicKey_ShouldHave32Characters {
    NSString *key = sut.publicKey;
    assertThat(@(key.length), is(@32));
}


- (void) testPrivateKey_ShouldHave40Characters {
    NSString *key = sut.privateKey;
    assertThat(@(key.length), is(@40));
}

- (void) testMD5OfString_ShouldYieldKnownResult {
    NSString *md5 = sut.calculateMD5(@"abc");
    assertThat(md5, is(@"900150983cd24fb0d6963f7d28e17f72"));
    // https://tools.ietf.org/html/rfc1321
}

//- (void)testURLParameters_ShouldHaveTimestampPublicKeyAndHash {
//    TestMarvelAuthentication *sutWithFakeMD5 = [[TestMarvelAuthentication alloc] init];
//    sutWithFakeMD5.timestamp = @"Timestamp";
//    sutWithFakeMD5.privateKey = @"Private";
//    sutWithFakeMD5.publicKey = @"Public";
//    
//    NSString *params = [sutWithFakeMD5 URLParameters];
//    
//    assertThat(params, is(@"&ts=Timestamp&apikey=Public&hash=MD5TimestampPrivatePublicMD5"));
//    
//}


- (void)testURLParameters_ShouldHaveTimestampPublicKeyAndHash {
    
    sut.timestamp = @"Timestamp";
    sut.privateKey = @"Private";
    sut.publicKey = @"Public";
    sut.calculateMD5 = ^(NSString *str) { return [NSString stringWithFormat:@"MD5%@MD5", str]; };
    
    NSString *params = [sut URLParameters];
    
    assertThat(params, is(@"&ts=Timestamp&apikey=Public&hash=MD5TimestampPrivatePublicMD5"));
    
}

@end
