***********************************************************************
* OBJETIVOS: SUBROTINA DO CALCULO DO DIGITO VERIFICADOR DO CPF
***********************************************************************
* PROCEDIMENTOS DE INICIALIZACAO DA SUBROTINA (LINKAGE CONVENTION)
***********************************************************************
ASMSCPF1 CSECT
         INICIO ASMSCPF1,R12
*
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
***********************************************************************
* PROCEDIMENTOS DE FINALIZACAO DA SUBROTINA (LINKAGE CONVENTION)
***********************************************************************
         FIM
***********************************************************************
* DEFINICAO DE AREAS DE DADOS
***********************************************************************
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
         END ASMSCPF1