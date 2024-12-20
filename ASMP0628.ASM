***********************************************************************
* OBJETIVOS: RECEBE PARM DO JCL E IMPRIME SAIDA SE COMECAR POR LETRA.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0628 AMODE 31
ASMP0628 RMODE 24
ASMP0628 CSECT
         INICIO ASMP0628,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R7,0(,R3)
         OPEN  (SAIDA,OUTPUT)
         CLI   2(R7),C'A'
         BL    ERR_PARM
         CLI   2(R7),C'Z'
         BNH   CONTINUA
ERR_PARM EQU   *
         MVC   MSG(18),=C'ERRO NO PARAMETRO.'
         PUT   SAIDA,MSG
         B     FIMPROG
CONTINUA EQU *
         MVC   MSG(10),2(R7)
         PUT   SAIDA,MSG
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
FIMPROG  EQU   *
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
MSG      DS    CL132
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=132,                                              *
               BLKSIZE=1320
*
         LTORG
*
         END ASMP0628