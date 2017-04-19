#import <XCTest/XCTest.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "POSMarvelAuthentication.h"

@interface TDDSampleApp_AcceptanceTests : XCTestCase

@end

@implementation TDDSampleApp_AcceptanceTests
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

- (void)testValidCallToMarvel_ShouldGerHTTPStatusCode200 {
    
    NSString *validQueryMissingAuthentication = @"http://gateway.marvel.com/v1/public/characters?nameStartsWith=Spider";
    POSMarvelAuthentication *authentication = [[POSMarvelAuthentication alloc] init];
    
    NSURL *validQueryURL = [NSURL URLWithString:[validQueryMissingAuthentication stringByAppendingString:[authentication URLParameters]]];
    
    __block NSHTTPURLResponse *httpResponse;
    [self startGetRequestToURL:validQueryURL withCompletionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        httpResponse = (NSHTTPURLResponse *)response;
    }];
    
    assertWithTimeout(5, thatEventually(@(httpResponse.statusCode)), is(@200));
}

- (void)startGetRequestToURL:(NSURL *)url withCompletionHandler:(void (^)(NSData *, NSURLResponse *, NSError *))completionHandler
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:completionHandler];
    
    [dataTask resume];
}

@end
