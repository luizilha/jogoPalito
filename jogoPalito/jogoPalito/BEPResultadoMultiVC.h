//
//  BEPResultadoMultiVC.h
//  jogoPalito
//
//  Created by luiz ilha on 6/20/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BEPResultadoMultiVC : UIViewController

@property (nonatomic) BOOL acabou;
@property (nonatomic) NSMutableArray *jogadores;
@property (weak, nonatomic) IBOutlet UILabel *lblVencedor;
@property (weak, nonatomic) IBOutlet UIImageView *imgCerveja;
@property (weak, nonatomic) IBOutlet UIButton *botao;


- (IBAction)proximaRodada:(id)sender;

@end
