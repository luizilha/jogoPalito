//
//  BEPMainViewController.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 26/05/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPMainViewController.h"

@interface BEPMainViewController ()

@end

@implementation BEPMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIImageView *)novoPalito:(int)posicao
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(posicao, 0, 100, 180)];
    UIImage *image = [UIImage imageNamed:@"palito.png"];
    imageView.image = image;
    return imageView;
}

- (IBAction)palitoFora:(id)sender
{
    if(self.incrementador > 0) {
        self.incrementador--;
        UIView *view = [self.viewPalitoMao.subviews objectAtIndex:0];
        [view removeFromSuperview];
        [self.viewPalitoFora addSubview:[self novoPalito:80*self.incrementador]];
    }
}

- (IBAction)palitoMao:(id)sender
{
    NSLog(@"%d %d",self.incrementador, self.jogador.max);
    if(self.incrementador < self.jogador.max) {
        UIView *view = [self.viewPalitoFora.subviews objectAtIndex:0];
        [view removeFromSuperview];
        [self.viewPalitoMao addSubview:[self novoPalito:80*self.incrementador]];
        self.incrementador++;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.incrementador = 0;
    self.jogador = [[BEPJogador alloc] init];
    self.jogador.max = 3;
    [self.viewPalitoFora addSubview:[self novoPalito:0]];
    [self.viewPalitoFora addSubview:[self novoPalito:80]];
    [self.viewPalitoFora addSubview:[self novoPalito:160]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmaEscolha:(id)sender
{
    
}


@end
