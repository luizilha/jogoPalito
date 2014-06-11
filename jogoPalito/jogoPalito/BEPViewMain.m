//
//  BEPViewMain.m
//  jogoPalito
//
//  Created by Neyllor Barbosa on 04/06/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import "BEPViewMain.h"
#import "BEPPalitosMaoViewController.h"
#import "BEPJogador.h"
#import "BEPViewDefineQtdJogadores.h"
@interface BEPViewMain ()

@end

@implementation BEPViewMain

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botaoSinglePlayer:(id)sender {
    BEPPalitosMaoViewController *v = [[BEPPalitosMaoViewController alloc] init];
    NSMutableArray *jogadores= [[NSMutableArray alloc]init];
    for(int i = 0; i < 4; i++){
        BEPJogador *jogador = [[BEPJogador alloc]init];
        jogador.max = 3;
        [jogadores addObject:jogador];
    }
    v.rodada = 2;
    v.jogadores = jogadores;
    [self.navigationController pushViewController:v animated:YES];
}

- (IBAction)multiplayer:(id)sender {
    BEPViewDefineQtdJogadores *qtde = [[BEPViewDefineQtdJogadores alloc] init];
    [self.navigationController pushViewController:qtde animated:YES];
}


@end
