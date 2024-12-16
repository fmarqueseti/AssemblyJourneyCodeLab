***********************************************************************
* OBJETIVOS: RECEBE, VIA PARM JCL, UM CPF, REALIZA UMA BUSCA NO ARQUIVO
*            VSAM, SE ENCONTRAR, CALCULA A MEDIA ARITMETICA DAS NOTAS E
*            REALIZA A ATUALIZACAO DO ARQUIVO VSAM (UPDATE).
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0623 AMODE 31
ASMP0623 RMODE 24
ASMP0623 CSECT
         INICIO ASMP0623,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   CPFPARM,0(R4)
*
         OPEN  (SAIDA,OUTPUT)
         OPEN  ALUNOS
         LTR   R15,R15
         BNZ   ERROVSAM                                   ERRO O (OPEN)
LER_ARQ  EQU   *
         MVC   CPF,CPFPARM
         GET   RPL=RPLVSAM
         LTR   R15,R15
         BNZ   ERRGVSAM                                   ERRO G (GET)
         PACK  N1P,N1
         PACK  N2P,N2
         PACK  N3P,N3
         PACK  N4P,N4
         PACK  N5P,N5
CALC_MED EQU *
         ZAP   TRAB,N1P
         AP    TRAB,N2P
         AP    TRAB,N3P
         AP    TRAB,N4P
         AP    TRAB,N5P
         CVB   R4,TRAB
         SRDA  R4,32
         ZAP   TRAB,=P'5'
         CVB   R6,TRAB
         ST    R6,NOTAS
         D     R4,NOTAS
         CVD   R5,TRAB
         ZAP   RESULT,TRAB
         UNPK  MEDIA,RESULT
         OI    MEDIA+3,X'F0'
         PUT   RPL=RPLVSAM
         LTR   R15,R15
         BNZ   ERRPVSAM                                    ERRO P (PUT)
         B     FIMPROG
ERRGVSAM EQU   *
         MVC   MSG(24),=C'REGISTRO NAO ENCONTRADO.'
         PUT   SAIDA,MSG
         B     FIMPROG
ERRPVSAM EQU   *
         MVC   MSG(23),=C'ERRO NO PUT DO VSAM01. '
         PUT   SAIDA,MSG
         B     FIMPROG
ERROVSAM EQU   *
         MVC   MSG(23),=C'ERRO NO OPEN DO VSAM01.'
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
N1P      DS    PL4
N2P      DS    PL4
N3P      DS    PL4
N4P      DS    PL4
N5P      DS    PL4
TRAB     DS    PL8
RESULT   DS    PL4
NOTAS    DS    F
CPFPARM  DS    CL11
*
REG_VSAM DS    0CL80
CPF      DS    CL11
NOME     DS    CL40
SEXO     DS    CL1
N1       DS    CL4
N2       DS    CL4
N3       DS    CL4
N4       DS    CL4
N5       DS    CL4
MEDIA    DS    CL4
         DC    4CL1' '
TAM_REG  EQU   *-REG_VSAM
*
ALUNOS   ACB   DDNAME=ALUNOS,                                          *
               AM=VSAM,                                                *
               MACRF=(KEY,SEQ,OUT)
*
RPLVSAM  RPL   ACB=ALUNOS,                                             *
               OPTCD=(KEY,DIR,UPD),                                    *
               ARG=CPF,                                                *
               AREA=REG_VSAM,                                          *
               AREALEN=TAM_REG,                                        *
               RECLEN=TAM_REG,                                         *
               KEYLEN=11
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
         END ASMP0623