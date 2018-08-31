//
//  ABVersion.h
//  ABVersion
//
//  Created by Alexander Barobin
//  Copyright © 2018 Alexander Barobin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark ABVersion
@interface ABVersion : NSObject<NSCopying>
@property (assign, nonatomic, readonly) long long majorVersion;
@property (assign, nonatomic, readonly) long long minorVersion;
@property (assign, nonatomic, readonly) long long patchVersion;
@property (nonnull, copy, nonatomic, readonly) NSString *formatted;

- (nonnull instancetype)init NS_UNAVAILABLE;
- (nullable instancetype)initWithVersionString:(nonnull NSString *)versionString;
+ (nullable instancetype)versionWithString:(nonnull NSString *)versionString NS_SWIFT_UNAVAILABLE("Use initWithVersionString instead");

- (BOOL)isGreatThanVersion:(nonnull ABVersion *)version NS_SWIFT_NAME(isGreatThan(version:));
- (BOOL)isGreatOrEqualThanVersion:(nonnull ABVersion *)version NS_SWIFT_NAME(isGreatOrEqualThan(version:));
- (BOOL)isEqualToVersion:(nonnull ABVersion *)version;
- (BOOL)isLessThanVersion:(nonnull ABVersion *)version NS_SWIFT_NAME(isLessThan(version:));
- (BOOL)isLessOrEqualThanVersion:(nonnull ABVersion *)version NS_SWIFT_NAME(isLessOrEqualThan(version:));

@end

#pragma mark - ABVersion
@interface ABVersion (UIApplication)
@property (nonnull, class, readonly) ABVersion *applicationVersion;
@property (nonnull, class, readonly) ABVersion *systemVersion;
@end
