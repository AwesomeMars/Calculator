//
//  Calculator.h
//  Sample
//
//  Created by user on 2016. 8. 23..
//  Copyright © 2016년 MarsCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
@property (nonatomic, assign) double accumulator; //property set, get method 를 대체한다.
//atomic : 다른 쓰레드가 접근할때 lock

//-(void)setAccumulator:(double)value;
//-(double)accumulator;

-(void)clear;
-(void)add:(double)value;
-(void)subtract:(double)value;
-(void)multiply:(double)value;
-(void)divide:(double)value;

@end
