//
//  BEPMainViewController.h
//  jogoPalito
//
//  Created by Neyllor Barbosa on 26/05/14.
//  Copyright (c) 2014 Luiz Ilha Moschem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BEPMainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewPalitoFora;
@property (weak, nonatomic) IBOutlet UIView *viewPalitoMao;
@property (nonatomic) int valorNaMao;

- (IBAction)confirmaEscolha:(id)sender;

- (UIImageView *) novoPalito:(int)posicao;
- (IBAction) incrementaPalito:(id)sender;
- (void) verificaPalitos:(int) palitos:(UIView *) telaAdd: (UIView *) telaRemove;

@end
