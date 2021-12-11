//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by 黄某某 on 2021/12/10.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTNewsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTDetailViewController : GTNewsViewController

-(instancetype)initWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
