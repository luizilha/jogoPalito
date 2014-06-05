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
@property (nonatomic)int incrementador;
@property (nonatomic)NSMutableArray *jogadores;
@property (nonatomic)BEPJogador *jogador;

- (IBAction)confirmaEscolha:(id)sender;
- (UIImageView *) novoPalito:(int)posicao;
- (IBAction)palitoFora:(id)sender;
- (IBAction)palitoMao:(id)sender;
//- (void) incrementaPalito:(int) palitos andAdiciona:(UIView *) adiciona;


@end
