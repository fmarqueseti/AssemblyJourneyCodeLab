***********************************************************************
* OBJETIVOS: LER UM CPF VIA PARM JCL, REALIZAR A VERIFICACAO DOS DIGI
*            TOS, INFORNAR SE E VALIDO OU NAO.
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
ASMP0611 AMODE 31
ASMP0611 RMODE 24
ASMP0611 CSECT
         INICIO ASMP0611,R12
***********************************************************************
* CORPO DO PROGRAMA
***********************************************************************
         L     R3,0(,R1)
         LA    R4,2(,R3)
         MVC   CPF_IN,0(R4)
*
         L     R9,=V(CALCCPF)
         LA    R7,CPFS
         BALR  R8,R9
*
         CLC   CPF_IN,CPF_OUT
         BNE   CPF_INV
         MVC   MSG+1(11),CPF_IN
         MVC   MSG+13(21),=C'CPF INFORMADO VALIDO.'
         B     IMPR_CPF
CPF_INV  EQU *
         MVC   MSG+1(11),CPF_IN
         MVC   MSG+13(27),=C'CPF INFORMADO NAO E VALIDO.'
IMPR_CPF EQU *
         OPEN (SAIDA,OUTPUT)
         PUT SAIDA,MSG
*
         CLOSE SAIDA
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DO PROGRAMA (LINKAGE CONVENTION)
***********************************************************************
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
CPFS     DS    0CL22
CPF_IN   DS    CL11
CPF_OUT  DS    CL11
*
MSG      DS    CL80
*
SAIDA    DCB   DDNAME=SAIDA,                                           *
               DSORG=PS,                                               *
               MACRF=PM,                                               *
               RECFM=FBA,                                              *
               LRECL=80,                                               *
               BLKSIZE=4000
*
         LTORG
*
         END ASMP0611
***********************************************************************
* CESECT CALCCPF
***********************************************************************
CALCCPF  CSECT
         USING CALCCPF,R9
         USING CPFS,R7
         MVC   CPF,CPF_IN
PACK_D10 EQU *
         BAL   R14,PACK_DIG
***********************************************************************
* CALCULO DO PRIMEIRO DIGITO VERIFICADOR
***********************************************************************
CALC_PDG EQU *
         ZAP   TOTAL,D01P
         MP    D02P,=P'2'
         AP    TOTAL,D02P
         MP    D03P,=P'3'
         AP    TOTAL,D03P
         MP    D04P,=P'4'
         AP    TOTAL,D04P
         MP    D05P,=P'5'
         AP    TOTAL,D05P
         MP    D06P,=P'6'
         AP    TOTAL,D06P
         MP    D07P,=P'7'
         AP    TOTAL,D07P
         MP    D08P,=P'8'
         AP    TOTAL,D08P
         MP    D09P,=P'9'
         AP    TOTAL,D09P
         ZAP   TRAB,TOTAL
         DP    TRAB,DIVISOR                          OU DP  TRAB,=P'11'
         MVC   RESULT,TRAB+4
         UNPK  DIGITO,RESULT
         OI    DIGITO+3,X'F0'
         CLC   DIGITO+2,=C'09'
         BNH   MOVE_D10
         MVI   D10,C'0'
MOVE_D10 EQU *
         MVC   D10,DIGITO+3
PACK_D11 EQU *
         BAL   R14,PACK_DIG
***********************************************************************
* CALCULO DO SEGUNDO DIGITO VERIFICADOR
***********************************************************************
CALC_SDG EQU *
         ZAP   TOTAL,D02P
         MP    D03P,=P'2'
         AP    TOTAL,D03P
         MP    D04P,=P'3'
         AP    TOTAL,D04P
         MP    D05P,=P'4'
         AP    TOTAL,D05P
         MP    D06P,=P'5'
         AP    TOTAL,D06P
         MP    D07P,=P'6'
         AP    TOTAL,D07P
         MP    D08P,=P'7'
         AP    TOTAL,D08P
         MP    D09P,=P'8'
         AP    TOTAL,D09P
         MP    D10P,=P'9'
         AP    TOTAL,D10P
         ZAP   TRAB,TOTAL
         DP    TRAB,DIVISOR
         MVC   RESULT,TRAB+4
         UNPK  DIGITO,RESULT
         OI    DIGITO+3,X'F0'
         CLC   DIGITO+2,=C'09'
         BNH   MOVE_D11
         MVI   D11,C'0'
         B     FIM_PROG
MOVE_D11 EQU *
         MVC   D11,DIGITO+3
         B     FIM_PROG
***********************************************************************
* CONVERTE DIGITOS PARA DECIMAL COMPACTADO
***********************************************************************
PACK_DIG EQU *
         PACK  D01P,D01
         PACK  D02P,D02
         PACK  D03P,D03
         PACK  D04P,D04
         PACK  D05P,D05
         PACK  D06P,D06
         PACK  D07P,D07
         PACK  D08P,D08
         PACK  D09P,D09
         PACK  D10P,D10
         BR    R14
FIM_PROG EQU *
         MVC   CPF_OUT,CPF
         BR    R8
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
R0       EQU   0
R1       EQU   1
R2       EQU   2
R3       EQU   3
R4       EQU   4
R5       EQU   5
R6       EQU   6
R7       EQU   7
R8       EQU   8
R9       EQU   9
R10      EQU  10
R11      EQU  11
R12      EQU  12
R13      EQU  13
R14      EQU  14
R15      EQU  15
*
CPF      DS CL11
         ORG CPF                                            * REDEFINES
D01      DS CL1
D02      DS CL1
D03      DS CL1
D04      DS CL1
D05      DS CL1
D06      DS CL1
D07      DS CL1
D08      DS CL1
D09      DS CL1
D10      DS CL1
D11      DS CL1
*
TRAB     DS PL8
TOTAL    DS PL4
RESULT   DS PL4
DIVISOR  DC PL2'11'
DIGITO   DS CL4
*
D01P     DS PL2
D02P     DS PL2
D03P     DS PL2
D04P     DS PL2
D05P     DS PL2
D06P     DS PL2
D07P     DS PL2
D08P     DS PL2
D09P     DS PL2
D10P     DS PL2
D11P     DS PL2
*
         LTORG
*
CPFS     DSECT                                          * DUMMY SECTION
CPF_IN   DS  CL11
CPF_OUT  DS  CL11
*
         END CALCCPF
