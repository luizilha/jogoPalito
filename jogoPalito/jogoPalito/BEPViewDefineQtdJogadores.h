//
//  BEPViewDefineQtdJogadores.h
//  jogoPalito
//
//  Created by Neyllor Barbosa on 29/05/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEPPalitosMaoViewController.h"

@interface BEPViewDefineQtdJogadores : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelNumeroJogadores;
@property (nonatomic) int numJogadores;

- (IBAction)incrementador:(id)sender;
- (IBAction)descrementador:(id)sender;
- (IBAction)iniciarJogo:(id)sender;


@end
