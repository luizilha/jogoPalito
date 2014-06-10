//
//  BEPViewApresentaResulSP.h
//  jogoPalito
//
//  Created by Neyllor Barbosa on 05/06/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEPJogador.h"

@interface BEPViewApresentaResulSP : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *vencedor;
@property (weak, nonatomic) IBOutlet UILabel *resultado;
@property (weak, nonatomic) IBOutlet UILabel *apostaPlayer;
@property (weak, nonatomic) IBOutlet UILabel *apostaA1;

@property (weak, nonatomic) IBOutlet UILabel *apostaA2;
@property (weak, nonatomic) IBOutlet UILabel *apostaA3;

@property (weak, nonatomic) IBOutlet UILabel *qtdPalitosPlayer;
@property (weak, nonatomic) IBOutlet UILabel *qtdPalitosA1;
@property (weak, nonatomic) IBOutlet UILabel *qtdPalitosA2;
@property (weak, nonatomic) IBOutlet UILabel *qtdPalitosA3;

@property (nonatomic) NSMutableArray *jogadores;
@property (nonatomic) int rodada;

- (IBAction)botaoOk:(id)sender;
- (void) preencheLabel:(UILabel *)palitos aposta:(UILabel *)aposta jogador:(BEPJogador *) jogador;
- (int) revelaResultado:(UILabel *)resultado jogadores:(NSMutableArray *) jogadores;
- (int) revelaVencedor:(UILabel *)vencedor and:(NSMutableArray *) jogadores and:(int) resultado;
- (void) subtraiVencedor:(UILabel *)palitos and:(UILabel *) aposta and:(int) qtdPalitos;

@end
