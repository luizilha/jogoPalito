//
//  BEPMainViewController.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 26/05/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPPalitosMaoViewController.h"
#import "BEPViewDefineAposta.h"
#import "BEPAppDelegate.h"
#import "BEPApostaMultiViewController.h"

@interface BEPPalitosMaoViewController ()

@end

@implementation BEPPalitosMaoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.rodada = 0;
    }
    return self;
}



- (UIImageView *)novoPalito:(int)posicao
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(posicao, 0, 100, 130)];
    UIImage *image = [UIImage imageNamed:@"palito.png"];
    imageView.image = image;
    return imageView;
}

- (IBAction)palitoFora:(id)sender
{
    if(self.incrementador > 0) {
        self.incrementador--;
        UIView *view = [self.viewPalitoMao.subviews objectAtIndex:self.viewPalitoMao.subviews.count-1];
        [view removeFromSuperview];
        [self.viewPalitoFora addSubview:[self novoPalito:(80 * self.incrementador)]];
    }
}

- (IBAction)palitoMao:(id)sender
{
    if(self.incrementador < self.jogador.max) {
        UIView *view = [self.viewPalitoFora.subviews objectAtIndex:self.viewPalitoFora.subviews.count-1];
        [view removeFromSuperview];
        [self.viewPalitoMao addSubview:[self novoPalito:(80 * self.incrementador)]];
        self.incrementador++;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.incrementador = 0;
    self.jogador = self.jogadores[0];
    for (int i = 0; i < self.jogador.max; i++) {
        [self.viewPalitoFora addSubview:[self novoPalito:(80 * i)]];
    }
    self.title = @"Jogador 1";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmaEscolha:(id)sender
{
    NSLog(@"QTDE JOGADORES: %d, RODADA: %d",(int) self.jogadores.count,self.rodada);
    if (self.modoSingle) {
        BEPViewDefineAposta *viewDefineAposta = [[BEPViewDefineAposta alloc]init];
        self.jogador.palitoMao = self.incrementador;
        viewDefineAposta.jogadores = self.jogadores;
        viewDefineAposta.rodada = self.rodada;
        for (int i = 1; i < [self.jogadores count]; i++) {
            BEPJogador *jogador = self.jogadores[i];
            jogador.palitoMao = arc4random() %jogador.max;
        }
        self.navigationController.navigationBar.hidden = YES;
        [self.navigationController pushViewController:viewDefineAposta animated:YES];
    } else if (self.rodada < self.jogadores.count) {
        self.title = [NSString stringWithFormat:@"jogador %d", self.rodada+2];
        switch (self.rodada) {
            case 0:
                [self.navigationController.navigationBar setBackgroundColor: [UIColor redColor]];
                break;
            case 1:
                [self.navigationController.navigationBar setBackgroundColor: [UIColor blueColor]];
                break;
            case 2:
                [self.navigationController.navigationBar setBackgroundColor: [UIColor orangeColor]];
                break;
            case 4:
                [self.navigationController.navigationBar setBackgroundColor: [UIColor greenColor]];
        }
        self.jogador.palitoMao = self.incrementador;
        [self.jogadores setObject:self.jogador atIndexedSubscript:self.rodada];
        self.title = [NSString stringWithFormat:@"jogador %d", self.rodada+2];
        //[self.navigationController.navigationBar setBackgroundColor:];
        self.rodada++;
    }
    if (self.jogadores.count == self.rodada) {
        BEPApostaMultiViewController *v = [[BEPApostaMultiViewController alloc] init];
        [self.navigationController pushViewController:v animated: YES];
    }
}


@end
