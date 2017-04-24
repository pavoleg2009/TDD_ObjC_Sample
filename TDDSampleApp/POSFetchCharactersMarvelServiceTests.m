
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import <XCTest/XCTest.h>
#import "POSFetchCharactersMarvelService.h"
#import "POSFetchCharactersRequestModel.h"

@interface POSFetchCharactersMarvelServiceTests : XCTestCase

@end

@implementation POSFetchCharactersMarvelServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFetchCharacters_ShouldAskURLSessionToCreateDataTask {

    NSURLSession *mockSession = mock([NSURLSession class]);
    POSFetchCharactersMarvelService *sut = [[POSFetchCharactersMarvelService alloc] initWithSession:mockSession];

    POSFetchCharactersRequestModel *requestModel = [[POSFetchCharactersRequestModel alloc]
            initWithNamePrefix:@"Dummi" pageSize:@10 offset:30];

    [sut fetchCaractersWithRequestModel:requestModel];

    [verify(mockSession) dataTaskWithURL:hasProperty(@"host", @"gateway.marvel.com") completionHandler:anything()];
}


- (void)testFetchCharacters_ShouldAMakeDataWithSecureConnection {
    NSURLSession *mockSession = mock([NSURLSession class]);
    POSFetchCharactersMarvelService *sut = [[POSFetchCharactersMarvelService alloc] initWithSession:mockSession];

    POSFetchCharactersRequestModel *requestModel = [[POSFetchCharactersRequestModel alloc]
            initWithNamePrefix:@"Dummi" pageSize:@10 offset:30];

    [sut fetchCaractersWithRequestModel:requestModel];

    [verify(mockSession) dataTaskWithURL:hasProperty(@"scheme", @"https") completionHandler:anything()];
}

@end
