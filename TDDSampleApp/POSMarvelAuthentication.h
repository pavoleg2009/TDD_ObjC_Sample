//
//  POSMarvelAuthentication.h
//  TDDSampleApp
//
//  Created by Oleg Pavlichenkov on 18/04/2017.
//  Copyright © 2017 Oleg Pavlichenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface POSMarvelAuthentication : NSObject

+ (NSString *)timestamp;
+ (NSString *)publicKey;
+ (NSString *)privateKey;

@end
