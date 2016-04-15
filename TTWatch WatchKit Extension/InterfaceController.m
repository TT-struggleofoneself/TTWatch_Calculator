//
//  InterfaceController.m
//  TTWatch WatchKit Extension
//
//  Created by TT_code on 16/4/12.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import "InterfaceController.h"

typedef enum : NSUInteger {
    TTOperatorTypeAdd,//+
    TTOperatorTypeminus,//-
    TTOperatorTyperide,//x
    TTOperatorTypeexcept//"/"
} TTOperatorType;


@interface InterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *result;
@property(nonatomic)TTOperatorType type;//当前运算符

/**
 *  前一个数字
 */
@property(nonatomic,strong)NSMutableString* pervalue;
/**
 *  当前数字
 */
@property(nonatomic,strong)NSMutableString* curvalue;

@end


@implementation InterfaceController


/**
 *  懒加载前一个值
 *
 *  @return
 */
-(NSMutableString *)pervalue
{
    if(!_pervalue){
        _pervalue=[NSMutableString string];
    }
    return _pervalue;
}

/**
 *  懒加载当前值
 *
 *  @return
 */
-(NSMutableString *)curvalue
{
    if(!_curvalue){
        _curvalue=[NSMutableString string];
    }
    return _curvalue;
}



- (IBAction)test0 {
    if (!self.curvalue.integerValue) {
        return;
    }
    [self setcurvlaue:@"0"];
}
- (IBAction)test1 {
    [self setcurvlaue:@"1"];
}
- (IBAction)test2 {
    [self setcurvlaue:@"2"];
}
- (IBAction)test3 {
    [self setcurvlaue:@"3"];
}
- (IBAction)test4 {
    [self setcurvlaue:@"4"];
}
- (IBAction)test5 {
    [self setcurvlaue:@"5"];
}
- (IBAction)test6 {
    [self setcurvlaue:@"6"];
}
- (IBAction)test7 {
    [self setcurvlaue:@"7"];
}
- (IBAction)test8 {
    [self setcurvlaue:@"8"];
}
- (IBAction)test9 {
    [self setcurvlaue:@"9"];
}


/**
 *  点
 */
- (IBAction)dian {
    [self setcurvlaue:@"."];
}

/**
 *  等于
 */
- (IBAction)equel {
    //计算结果的时候
    NSLog(@"打印数字  %@    %@",self.pervalue,self.curvalue);
    switch (self.type) {
        case TTOperatorTypeAdd://加
            [self.result setText:[NSString stringWithFormat:@"%.f",self.pervalue.doubleValue+self.curvalue.doubleValue]];
            NSLog(@"我是   加");
            break;
        case TTOperatorTypeminus://减
            [self.result setText:[NSString stringWithFormat:@"%.f",self.pervalue.doubleValue-self.curvalue.doubleValue]];
             NSLog(@"我是   减");
            break;
        case TTOperatorTyperide://乘
             [self.result setText:[NSString stringWithFormat:@"%.f",self.pervalue.doubleValue*self.curvalue.doubleValue]];
            NSLog(@"我是   乘");
            break;
        case TTOperatorTypeexcept://除
             [self.result setText:[NSString stringWithFormat:@"%.f",self.pervalue.doubleValue/self.curvalue.doubleValue]];
             NSLog(@"我是   除");
            break;
            
        default:
            break;
    }
}


- (IBAction)Clear {
    self.pervalue=nil;
    self.curvalue=nil;
    [self.result setText:@"0"];
}




/**
 *  加
 */
- (IBAction)plus {
    [self setexcept:TTOperatorTypeAdd];
}

/**
 *  减
 */
- (IBAction)minus {
    [self setexcept:TTOperatorTypeminus];
}

/**
 *  乘
 */
- (IBAction)ride {
    [self setexcept:TTOperatorTyperide];
}

/**
 *  除
 */
- (IBAction)except {
    [self setexcept:TTOperatorTypeexcept];
}

/**
 *  输入数字
 *
 */
-(void)setcurvlaue:(NSString*)value
{
    //先保存数据
    [self.curvalue appendString:value];
    //显示到label
    [self.result setText:self.curvalue];
}

/**
 *  输入运算符
 *
 */
-(void)setexcept:(TTOperatorType)type
{
    //当前数字赋值给前一个数字
    self.pervalue=self.curvalue;
    self.curvalue=nil;
    self.type=type;
    
}

@end



