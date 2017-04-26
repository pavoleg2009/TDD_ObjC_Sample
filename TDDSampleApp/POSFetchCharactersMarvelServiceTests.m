
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import <XCTest/XCTest.h>
#import "POSFetchCharactersMarvelService.h"
#import "POSFetchCharactersRequestModel.h"

@interface POSFetchCharactersMarvelServiceTests : XCTestCase
{
    NSURLSession *mockSession;
    POSFetchCharactersMarvelService *sut;
    NSURLSessionDataTask *mockDataTask;
}
@end

@implementation POSFetchCharactersMarvelServiceTests

- (void)setUp {
    [super setUp];
    mockSession = mock([NSURLSession class]);
    sut = [[POSFetchCharactersMarvelService alloc] initWithSession:mockSession];
    //mockDataTask = mock([NSURLSessionDataTask class]);
}

- (void)tearDown {
    mockSession = nil;
    sut = nil;
    //mockDataTask = nil;
    [super tearDown];
}

- (void)testFetchCharacters_ShouldAskURLSessionToCreateDataTask {

    POSFetchCharactersRequestModel *requestModel = [[POSFetchCharactersRequestModel alloc]
            initWithNamePrefix:@"Dummy" pageSize:@10 offset:30];

    [sut fetchCharactersWithRequestModel:requestModel];

    [verify(mockSession) dataTaskWithURL:hasProperty(@"host", @"gateway.marvel.com") completionHandler:anything()];
}


- (void)testFetchCharacters_ShouldAMakeDataWithSecureConnection {

    POSFetchCharactersRequestModel *requestModel = [[POSFetchCharactersRequestModel alloc]
            initWithNamePrefix:@"Dummy" pageSize:@10 offset:30];

    [sut fetchCharactersWithRequestModel:requestModel];

    [verify(mockSession) dataTaskWithURL:hasProperty(@"scheme", @"https") completionHandler:anything()];
}

- (void)testFetchCharacter_WithNamePrefix_ShouldMakeDataTaskWithNameStartsWithParameter {

    POSFetchCharactersRequestModel *requestModel =
            [[POSFetchCharactersRequestModel alloc] initWithNamePrefix:@"NAME"
                                                              pageSize:10
                                                                offset:30];
//    NSURL *expextedURL = [NSURL URLWithString:@"https://gateway.marvel.com/v1/public/characters?nameStartsWith=NAME"];
    [sut fetchCharactersWithRequestModel:requestModel];

    HCArgumentCaptor *argument = [[HCArgumentCaptor alloc] init];
    [verify(mockSession) dataTaskWithURL:(id)argument completionHandler:anything()];
    NSURL *urlArgument = argument.value;
    
//    NSLog(@"%@", ((NSURL *)argument.value));
//    NSLog(@"%@", ((NSURL *)argument.value).query);
//    NSRange range = [urlArgument.query rangeOfString:@"nameStartsWith=NAME"];
//    XCTAssertNotEqual(range.location, NSNotFound);

    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:urlArgument
                                                resolvingAgainstBaseURL:NO];
    NSArray<NSURLQueryItem *> *queryItems = urlComponents.queryItems;

//    for (int i = 0; i < queryItems.count; ++i) {
//        NSLog(@"%d. %@ - %@", i, queryItems[i].name, queryItems[i].value);
//    }

    NSURLQueryItem *item = [[NSURLQueryItem alloc] initWithName:@"nameStartsWith" value:@"NAME"];
    XCTAssertTrue([queryItems containsObject:item]);
}

@end
