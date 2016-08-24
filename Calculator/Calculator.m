//
//  Calculator.m
//  Sample
//
//  Created by user on 2016. 8. 23..
//  Copyright © 2016년 MarsCorp. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
//{
//    double accumulator;
//}

//-(void) setAccumulator:(double)value
//{
//    accumulator = value;
//}

-(void)clear
{
//    self.accumulator = 0;
    _accumulator = 0; //으로 사용 가능(@synthesize
}

//-(double) accumulator
//{
 //   return accumulator;
//}

-(void)add:(double)value
{
    self.accumulator += value;
    
}

-(void)subtract:(double)value
{
    self.accumulator -=value;
    
}

-(void)multiply:(double)value
{
    self.accumulator *= value;
}

-(void)divide:(double)value
{
    self.accumulator /=value;
}
@end
