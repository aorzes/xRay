//
//  ViewController.m
//  xRay
//
//  Created by Anton Orzes on 13/02/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    tijelo = [[UIImageView alloc] init];
    tijelo.image = [UIImage imageNamed:@"tijelo"];
    tijelo.frame = CGRectMake(20, 50, (self.view.frame.size.height-50)*0.5625, self.view.frame.size.height-50);
    [self.view addSubview:tijelo];
    
    zid = [[UIImageView alloc] init];
    zid.image = [UIImage imageNamed:@"zidXray"];
    zid.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:zid];
    
    
    
    tijelo1 = [[UIImageView alloc] init];
    tijelo1.image = [UIImage imageNamed:@"tijelo1"];
    tijelo1.frame = CGRectMake(20, 50, (self.view.frame.size.height-50)*0.5625, self.view.frame.size.height-50);
    [self.view addSubview:tijelo1];
    
    kx=tijelo.image.size.width/tijelo.frame.size.width;
    
    komad = [[UIImageView alloc] init];
    komad.image = [UIImage imageNamed:@"podlogaXekrana"];
    komad.frame = CGRectMake(10, 90, self.view.frame.size.width/2.2, self.view.frame.size.width/2.2);
    [self.view addSubview:komad];
    
    CALayer *borderLayer1 = [CALayer layer];
    CGRect borderFrame1 = CGRectMake(0, 0, komad.frame.size.width, komad.frame.size.width);
    [borderLayer1 setBackgroundColor:[[UIColor clearColor] CGColor]];
    [borderLayer1 setBorderColor:[[UIColor blackColor] CGColor]];
    [borderLayer1 setFrame:borderFrame1];
    //[borderLayer1 setCornerRadius:5];
    [borderLayer1 setBorderWidth:5];
    [komad.layer addSublayer:borderLayer1];
    //sjena
    komad.layer.shadowColor = [UIColor blackColor].CGColor;
    komad.layer.shadowOffset = CGSizeMake(5, 10);
    komad.layer.shadowOpacity = 0.4;
    komad.layer.shadowRadius = 1.0;
   
    okviric = [[UIImageView alloc] init];
    okviric.image = [UIImage imageNamed:@"podlogaXekrana"];
    okviric.frame = CGRectMake(50, komad.frame.origin.y + komad.frame.size.height+ 30, 100, 100);
    [self.view addSubview:okviric];
    
    konzola = [[UIImageView alloc] init];
    konzola.image = [UIImage imageNamed:@"konzola"];
    konzola.frame = CGRectMake(50+okviric.frame.size.width/2-10, 0, 15, okviric.frame.origin.y);
    [self.view addSubview:konzola];
    
    CALayer *borderLayer = [CALayer layer];
    CGRect borderFrame = CGRectMake(0, 0, okviric.frame.size.width, okviric.frame.size.width);
    [borderLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
    [borderLayer setBorderColor:[[UIColor orangeColor] CGColor]];
    [borderLayer setFrame:borderFrame];
    [borderLayer setCornerRadius:8];
    [borderLayer setBorderWidth:4];
    [okviric.layer addSublayer:borderLayer];
    
    okviric.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture =   [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(paneMe:)];
    [okviric addGestureRecognizer:panGesture];
    
    [self.view bringSubviewToFront:tijelo1];
    [self.view bringSubviewToFront:konzola];
    [self.view bringSubviewToFront:okviric];
    [self.view bringSubviewToFront:navBar];
   
    
}

-(IBAction)paneMe:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation=[recognizer translationInView:self.view];
    recognizer.view.center=CGPointMake(recognizer.view.center.x+translation.x,recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    [self prikazi];
}

-(void) prikazi{

    CGRect pp = okviric.frame;
    
    if(okviric.frame.origin.x<50) {pp.origin.x = 50; okviric.frame = pp;}
    if(okviric.frame.origin.y<50) {pp.origin.y = 50; okviric.frame = pp;}
    if(okviric.frame.origin.y>self.view.frame.size.height-okviric.frame.size.height) {pp.origin.y = self.view.frame.size.height-okviric.frame.size.height; okviric.frame = pp;}
    if(okviric.frame.origin.x>self.view.frame.size.width-okviric.frame.size.width) {pp.origin.x = self.view.frame.size.width-okviric.frame.size.width; okviric.frame = pp;}
    
    
    CGPoint polozaj = CGPointMake((okviric.frame.origin.x-20)* kx, (okviric.frame.origin.y-50)* kx);
    CGImageRef ref = CGImageCreateWithImageInRect(tijelo.image.CGImage, CGRectMake(polozaj.x, polozaj.y, 100*kx, 100*kx));
    komad.image = [UIImage imageWithCGImage:ref];
    okviric.image = [UIImage imageWithCGImage:ref];
    CGImageRelease(ref);
    konzola.frame = CGRectMake(okviric.frame.origin.x + okviric.frame.size.width/2-10, 0, 15, okviric.frame.origin.y);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
