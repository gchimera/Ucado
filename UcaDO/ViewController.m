//
//  ViewController.m
//  UcaDO
//
//  Created by Hamid Mehmood on 14/02/17.
//  Copyright © 2017 Hamid Mehmood. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *pathForFile = [[NSBundle mainBundle] pathForResource: @"loader" ofType: @"gif"];
    
    NSData * gifData = [NSData dataWithContentsOfFile: pathForFile];
    
    [self.webview loadData:gifData MIMEType:@"image/gif" textEncodingName:@"utf-8" baseURL:[NSURL URLWithString:@"http://"]];
    
    self.webview.opaque = NO;
    
    self.webview.backgroundColor = [UIColor clearColor];
    
    self.webview.center = self.view.center;
    
    [self.view addSubview:self.webview];
    [self.webview setHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
