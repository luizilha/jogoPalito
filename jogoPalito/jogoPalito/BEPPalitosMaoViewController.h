//
//  BEPMainViewController.h
//  jogoPalito
//
//  Created by Neyllor Barbosa on 26/05/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEPJogador.h"

@interface BEPPalitosMaoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewPalitoFora;
@property (weak, nonatomic) IBOutlet UIView *viewPalitoMao;
@property (weak, nonatomic) IBOutlet UIButton *btnMais;
@property (weak, nonatomic) IBOutlet UIButton *btnMenos;

@property (nonatomic) int incrementador;
@property (nonatomic) NSMutableArray *jogadores;
@property (nonatomic) BEPJogador *jogador;
@property (nonatomic) int rodada;
@property (nonatomic) BOOL modoSingle;


- (IBAction)incrementaPalito:(id)sender;

- (IBAction)confirmaEscolha:(id)sender;
- (UIImageView *) novoPalito:(int)posicao;
//- (void) incrementaPalito:(int) palitos andAdiciona:(UIView *) adiciona;


@end
