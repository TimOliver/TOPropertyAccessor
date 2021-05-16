//
//  TOTestAccessor.h
//  TOPropertyAccessorExample
//
//  Created by Tim Oliver on 16/5/21.
//

#import "TOPropertyAccessor.h"

NS_ASSUME_NONNULL_BEGIN

@interface TOTestAccessor : TOPropertyAccessor

@property (nonatomic, assign) NSInteger integer;
@property (nonatomic, copy) NSString *string;

@end

NS_ASSUME_NONNULL_END
