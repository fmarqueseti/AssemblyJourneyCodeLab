***********************************************************************
* OBJETIVOS: IMPRIME DATA E HORA DA COMPILACAO.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0627 AMODE 31
ASMP0627 RMODE 24
ASMP0627 CSECT
         INICIO ASMP0627,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         MVC   MSG(8),DATA
         PUT   SAIDA,MSG
         MVC   MSG(132),=132CL1' '
         MVC   MSG(8),HORA
         PUT   SAIDA,MSG
         MVC   MSG(132),=132CL1' '
         MVC   MSG(8),DATAT
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
DATAT    DC    CL8'&SYSDATE'
DATA     DC    CL8'&SYSDATC'
HORA     DC    CL8'&SYSTIME'
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
         END ASMP0627
