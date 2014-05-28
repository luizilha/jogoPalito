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
    int valorInc = (int) incrementador.value;
    [self verificaPalitos:valorInc :self.viewPalitoMao:self.viewPalitoFora];
}

- (void)verificaPalitos:(int)palitos :(UIView *)telaAdd :(UIView *)telaRemove
{
    while (telaRemove.subviews.count != 0) {
        UIView *view = [telaRemove.subviews objectAtIndex:0];
        [view removeFromSuperview];
    }
    while (telaAdd.subviews.count != 0) {
        UIView *view = [telaAdd.subviews objectAtIndex:0];
        [view removeFromSuperview];
    }
    for (int i = 0; i < (3 - palitos) ; i++) {
        [telaRemove addSubview:[self novoPalito:40 * i+1]];
    }
    for (int i = 0; i < palitos; i++) {
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
