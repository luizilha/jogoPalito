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

- (IBAction)incrementaPalito:(id)sender
{
    if (sender == self.btnMais) {
        if (self.incrementador < [self.jogadores[self.rodada] max]) {
            self.incrementador++;
        }
    } else if (sender == self.btnMenos) {
        if (self.incrementador > 0) {
            self.incrementador--;
        }
    }

    // REMOVE
    for (UIView *v in [self.viewPalitoMao subviews]) {
        if (v != self.btnMais) {
            [v removeFromSuperview];
        }
    }
    for (UIView *v in [self.viewPalitoFora subviews]) {
        if (v != self.btnMenos) {
            [v removeFromSuperview];
        }
    }
    // Adiciona
    for (int i = 0; i < self.incrementador; i++) {
        [self.viewPalitoMao addSubview:[self novoPalito:80 * i]];
    }
    for (int i = 0; i < ([self.jogadores[self.rodada] max]-self.incrementador); i++) {
        [self.viewPalitoFora addSubview:[self novoPalito:80 * i]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.incrementador = 0;
    for (int i = 0; i < [self.jogadores[self.rodada] max]; i++) {
        [self.viewPalitoFora addSubview:[self novoPalito:(80 * i)]];
    }
    self.title = [NSString stringWithFormat:@"Jogador %d", self.rodada+1];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmaEscolha:(id)sender
{
    if (self.modoSingle) {
        BEPViewDefineAposta *viewDefineAposta = [[BEPViewDefineAposta alloc]init];
        self.jogador.palitoMao = self.incrementador;
        viewDefineAposta.jogadores = self.jogadores;
        viewDefineAposta.rodada = self.rodada;
        for (int i = 1; i < [self.jogadores count]; i++) {
            BEPJogador *jogador = self.jogadores[i];
            jogador.palitoMao = arc4random() %jogador.max;
        }
        [self.navigationController pushViewController:viewDefineAposta animated:YES];
    } else if (self.rodada < self.jogadores.count) {
        [self.jogadores[self.rodada] setPalitoMao:self.incrementador];
        if (self.rodada+1 == self.jogadores.count) {
            BEPApostaMultiViewController *v = [[BEPApostaMultiViewController alloc] init];
            v.jogadores = self.jogadores;
            NSMutableString *temp = [[NSMutableString alloc] init];
            NSMutableString *temp2 = [[NSMutableString alloc] init];
            for (int i = 1; i < self.jogadores.count+1; i++) {
                [temp appendString:[NSString stringWithFormat:@"%7d",i]];
                [temp2 appendString:[NSString stringWithFormat:@"%7s","X"]];
            }
            v.qtdJogadores = temp;
            v.chuteJogadores = temp2;
            v.rodada = 0;
            [self.navigationController pushViewController:v animated: YES];
        } else {
            BEPPalitosMaoViewController *novo = [[BEPPalitosMaoViewController alloc] init];
            novo.jogadores = self.jogadores;
            novo.rodada = self.rodada+1;
            [self.navigationController pushViewController:novo animated:YES];
        }
    }
}

@end
