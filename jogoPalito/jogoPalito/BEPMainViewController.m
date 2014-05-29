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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(posicao, 0, 100, 150)];
    UIImage *image = [UIImage imageNamed:@"palito.png"];
    imageView.image = image;
    return imageView;
}

- (IBAction)incrementaPalito:(id)sender
{
    UIStepper *incrementador = (UIStepper *) sender;
    
    //int valorMao = (int) self.viewPalitoMao.subviews.count;
    //int valorFora = (int) self.viewPalitoFora.subviews.count;
    int valorInc = (int) incrementador.value;
    if (valorInc < (int)incrementador.value) {
        [self verificaPalitos:valorInc :self.viewPalitoMao:self.viewPalitoFora];
    }else
        [self verificaPalitos:valorInc :self.viewPalitoFora:self.viewPalitoMao];
    
}

- (void)verificaPalitos:(int)palitos :(UIView *)telaAdd :(UIView *)telaRemove
{

    for (int i = 0; i < palitos; i++) {
        NSLog(@"entrou");
        [telaAdd addSubview:[self novoPalito:40 * i+1]];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.valorNaMao = 0;
    [self.viewPalitoFora addSubview:[self novoPalito:40]];
    [self.viewPalitoFora addSubview:[self novoPalito:80]];
    [self.viewPalitoFora addSubview:[self novoPalito:120]];
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
