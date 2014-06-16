//
//  BEPApostaMultiViewController.h
//  jogoPalito
//
//  Created by Luiz Ilha Moschem on 6/16/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEPJogador.h"

@interface BEPApostaMultiViewController : UIViewController

@property (nonatomic) NSMutableArray *jogadores;
@property (nonatomic) int *rodada;

@property (weak, nonatomic) IBOutlet UILabel *lblQtdeJogadores;
@property (weak, nonatomic) IBOutlet UILabel *lblPontuacaoJogadores;
@property (weak, nonatomic) IBOutlet UIStepper *imprementador;
@property (weak, nonatomic) IBOutlet UILabel *lblValorAposta;

- (IBAction)aposta:(id)sender;

@end
