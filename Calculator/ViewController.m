//
//  ViewController.m
//  Calculator
//
//  Created by user on 2016. 8. 24..
//  Copyright © 2016년 MarsCorp. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

enum opr {none, plus, minus, divide, multiply};
typedef enum opr Operator;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController
{
    int currentValue;
    //연산자 저장변수->typedef 했으므로 아래와 같이 사용할 것임
    //NSString *currentOpr;
    Operator currentOpr;
    Calculator *calc;
}
- (IBAction)buttonClicked:(UIButton *)sender {
    UIButton *btn = (UIButton * )sender; //위에 ID * 로 넘어왔을 경우 형변환
    int value = (int)btn.tag;

    if (currentOpr == none)
    {
        currentValue =currentValue * 10 + value;
    }
    else{
        currentValue = value;
    }
    self.myLabel.text = [NSString stringWithFormat:@"%d", currentValue];  //문자열 처리를 위해 주로 사용 되는 stringWithFormat
    
//    생성된 정보는 스토리보드에도 저장 되니 삭제시 주의!(왼쪽 똥글 뱅이 참조)
//    또는 디자이너의 viewcontroller 를 클릭하여 오른쪽 속성창의 connection inspector를 찾아본다.
//    NSLog(@"%d buttonClicked",value);
}
- (IBAction)clickOpr:(id)sender {
    UIButton *btn = (UIButton *)sender;
    int tagNum = (int)btn.tag;
    
    switch(tagNum){
        case 1:
            currentOpr = plus;
            break;
        case 2 :
            currentOpr = minus;
            break;
        case 3 :
            currentOpr = multiply;
            break;
        case 4 :
            currentOpr = divide;
            break;
        default :
            break;
    }
    [calc setAccumulator:currentValue];
}
- (IBAction)clickEqual:(id)sender {
    
    switch(currentOpr){
        case plus:
            [calc add: currentValue];
            currentValue = [calc accumulator];
            break;
        case minus:
            [calc subtract:currentValue];
            currentValue = [calc accumulator];
            break;
        case multiply:
            [calc multiply: currentValue];
            currentValue = [calc accumulator];
            break;
        case divide:
            [calc divide: currentValue];
            currentValue = [calc accumulator];
            break;
        default:
            break;
    }
    self.myLabel.text = [NSString stringWithFormat:@"%d", currentValue];
}

- (IBAction)clear:(id)sender {
    currentValue = 0;
    self.myLabel.text = @"0";
}

- (IBAction)unwind:(UIStoryboardSegue *)sender{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    calc = [[Calculator alloc]init];
    currentOpr = none;
    currentValue = 0;
    self.myLabel.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
