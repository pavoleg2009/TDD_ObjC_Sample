//
//  POSMarvelAuthentication.h
//  TDDSampleApp
//
//  Created by Oleg Pavlichenkov on 18/04/2017.
//  Copyright © 2017 Oleg Pavlichenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface POSMarvelAuthentication : NSObject

//+ (NSString *)timestamp;
//- (NSString *)timestamp;

@property (nonatomic, copy) NSString *timestamp;
@property (nonatomic, copy) NSString *publicKey;
@property (nonatomic, copy) NSString *privateKey;
@property (nonatomic, copy) NSString *(^calculateMD5)(NSString *);

//- (NSString *)MD5OfString:(NSString *)str;
- (NSString *)URLParameters;

@end
