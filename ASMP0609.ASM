***********************************************************************
* OBJETIVOS: REALIZA UM LACO, LENDO TODOS OS REGISTROS DE UM KSAN,
*            CALCULA A MEDIA E IMPRIME: NOME, MEDIA E SITUACAO DO ALUNO
*            OBS.: SEPARADO O CALCULO DA MEDIA (BAS)
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0609 AMODE 31
ASMP0609 RMODE 24
ASMP0609 CSECT
         INICIO ASMP0609,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         OPEN  (SAIDA,OUTPUT)
         OPEN  (ALUNOS,INPUT)
         LTR   R15,R15
         BNZ   ROT_ABND
LER_REG  EQU   *
         GET   ALUNOS,REGISTRO
         MVC   MSG+1(40),NOME
         PACK  N1P,N1
         PACK  N2P,N2
         PACK  N3P,N3
         PACK  N4P,N4
         PACK  N5P,N5
         BAS   R7,CALC_MED
         ZAP   RESULT,TRAB
         MVC   RESULTO,=X'402021206B2020'
         ED    RESULTO,RESULT
         MVC   MSG+41(7),RESULTO
         CP    MEDIA,=P'0700'                     MEDIA SETE
         BL    SITREPR
         MVC   MSG+49(9),=C'APROVADO '
         PUT   SAIDA,MSG
         B     LER_REG
SITREPR  EQU *
         MVC   MSG+49(9),=C'REPROVADO'
         PUT   SAIDA,MSG
         B     LER_REG
***********************************************************************
* CALCULO DA MEDIA
***********************************************************************
CALC_MED EQU *
         ZAP   TRAB,N1P
         AP    TRAB,N2P
         AP    TRAB,N3P
         AP    TRAB,N4P
         AP    TRAB,N5P
         CVB   R4,TRAB
         SRDA  R4,32                              OU  SRDA R4,B'100000'
         ZAP   TRAB,=P'5'                         CINCO PARCELAS
         CVB   R6,TRAB
         ST    R6,NOTAS
         D     R4,NOTAS
         CVD   R5,TRAB
         ZAP   MEDIA,TRAB
         SRP   TRAB,2,0
         BR    R7
***********************************************************************
* ROTINA DE ABEND
***********************************************************************
ROT_ABND EQU   *
         MVC   MSG(12),=C'OPEN FALHOU.'
         PUT   SAIDA,MSG
***********************************************************************
* FINALIZA (FECHA) OS DATASETS
***********************************************************************
FIMARQ   EQU   *
         CLOSE SAIDA
         CLOSE ALUNOS
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
REGISTRO DS    0CL80
MATRIC   DS    CL6
NOME     DS    CL40
SEXO     DS    CL1
N1       DS    CL4
N2       DS    CL4
N3       DS    CL4
N4       DS    CL4
N5       DS    CL4
         DC    13CL1' '
*
N1P      DS    PL4
N2P      DS    PL4
N3P      DS    PL4
N4P      DS    PL4
N5P      DS    PL4
RESULT   DS    PL4
TRAB     DS    PL8
MEDIA    DS    PL4
NOTAS    DS    F
*
RESULTO  DS    CL7
*
MSG      DS    CL80
         DC    1CL1' '
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=80,                                               *
               BLKSIZE=4000
*
ALUNOS   DCB   DDNAME=ALUNOS,                                          *
               DSORG=PS,                                               *
               MACRF=GM,                                               *
               RECFM=FB,                                               *
               LRECL=80,                                               *
               BLKSIZE=27920,                                          *
               EODAD=FIMARQ
*
         LTORG
*
         END
