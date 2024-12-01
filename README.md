# 🇧🇷 Repositório de Códigos Assembly para Mainframe

Bem-vindo ao meu repositório de códigos Assembly desenvolvidos durante o curso "Assembly for Mainframe" no INEFE. Aqui, você encontrará todos os códigos que elaboramos ao longo do curso, desde os conceitos básicos até aplicações mais avançadas.

## Estrutura do Repositório

- **[ASMP0600.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0600.ASM)**: Programa clássico "Hello World" utilizando a macro WTO.
- **[ASMP0601.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0601.ASM)**: Criação de uma área de dados e PUT da mesma em um data set.
- **[ASMP0602.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0602.ASM)**: Criação de uma área de dados, que recebe um texto (de até 20 bytes) via PARM e realiza um PUT da mesma em um data set.
- **[ASMP0603.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0603.ASM)**: Criação de uma área de dados, que recebe um texto via SYSIN e realiza um laço para dar um PUT da mesma em um data set. Extração das rotinas de linkage convention para macros que criamos.
- **[ASMP0604.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0604.ASM)**: Recebe dois números, no formato caracter, do SYSIN, realiza a conversão para decimal compactado (PACK), realiza soma (AP) e subtração (SP), formata e realiza um PUT dos resultados em um data set.
- **[ASMP0605.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0605.ASM)**: Recebe dois números, no formato caracter, do SYSIN, realiza a conversão para decimal compactado (PACK), realiza multiplicação (MP) e divisão (DP), formata e realiza um PUT dos resultados em um data set, inclundo o resto da divisão.
- **[ASMP0606.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0606.ASM)**: Recebe dois números, no formato caracter, do SYSIN, realiza a conversão para binário (CVB), realiza soma (AR) e subtração (SR), formata e realiza um PUT dos resultados em um data set. Realiza o ajuste na quantidade de decimais (SRP).
- **[ASMP0607.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0607.ASM)**: Recebe dois números, no formato caracter, do SYSIN, realiza a conversão para binário (CVB), realiza soma (AR) e subtração (SR), formata e realiza um PUT dos resultados em um data set. Realiza o ajuste na quantidade de decimais (SRP).
- **[ASMP0608.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0608.ASM)**: Realiza um laço, para leitura de um arquivo KSAM, calcula a média e imprime um relatório contendo: nome, média e situação do aluno.
- **[ASMP0609.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0609.ASM)**: Mesmo comportamento que o [ASMP0608.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0608.ASM), tendo sido separado o cálculo da média (BAS).
- **[ASMP0610.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0610.ASM)**: **DEVER DE CASA** - Mesmo comportamento que o [ASMP0610.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0610.ASM), ao final, imprimir estatísticas do relatório totalizando, por gênero, os aprovados e reprovados.
- **[CPF.TXT](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/CPF.TXT)**: Lógica do cálculo dos dígitos verificadores do CPF.
- **[ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0611.ASM)**: Ler um texto via PARM (CPF), realiza a verificação do dígito verificador e retornar se é válido ou não.
- **[ASMP0612.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0612.ASM)**: Mesmo comportamento que o [ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0611.ASM), tendo sido separada a rotina do cálculo do dígito verificador. A rotina é chamada via CALL.
- **[ASMP0613.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0613.ASM)**: Mesmo comportamento que o [ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0611.ASM), tendo sido separada a rotina do cálculo do dígito verificador. A rotina é chamada via LINK.
- **[ASMP0614.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0614.ASM)**: Mesmo comportamento que o [ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0611.ASM), tendo sido separada a rotina do cálculo do dígito verificador. A rotina é chamada via LOAD.
- **[COBP0601.COB](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/COBP0601.COB)**: Programa COBOL que realiza a achamada da rotina escrita em assembly [ASMSCPF0.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMSCPF0.ASM).
- **[ASME0601.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASME0601.ASM)**: **EXERCÍCIO** - Mesmo comportamento que o [ASMP0613.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0613.ASM), lendo diversos valores (CPFs) a partir da SYSIN.
- **[ASMP0616.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0616.ASM)**: Ilustra o uso de área de memória compartilhada (vide arquivo [AREACOMM.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/AREACOMM.ASM)).
- **[ASME0602.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASME0601.ASM)**: **EXERCÍCIO** - Ler uma lista de [CPFs](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/CPFSIN.TXT) via arquivo KSAM, realizar o cálculo dos dígitos verificadores e gravar o resultado em um novo arquivo KSAM.
- **[ASMP0617.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0617.ASM)**: Mesmo comportamento que o [ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0616.ASM), utilizando-se de área de memória compartilhada (vide arquivo [COMMAREA.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/COMMAREA.ASM)).
- **[ASMP0619.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0619.ASM)**: Lê uma lista de CPFs e uma lista de [alunos](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ALUNOS.TXT), via arquivo KSAM, realiza a troca da chave do registro de alunos da matrícula palo CPF calculado e grava o registro em um novo arquivo KSAM.

## Como Usar

1. Clone este repositório usando o comando:
   ```bash
   git clone https://github.com/fmarqueseti/AssemblyJourneyCodeLab.git

## Contato

Para dúvidas ou sugestões, entre em contato pelo perfil do GitHub ou do [LinkedIn](http://www.linkedin.com/in/fmrqs/).

# 🇺🇸 Assembly for Mainframe Code Repository

Welcome to my repository of Assembly codes developed during the "Assembly for Mainframe" course at INEFE. Here, you will find all the codes we've created throughout the course, from basic concepts to more advanced applications.

## Repository Structure
- **[ASMP0600.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0600.ASM)**: Classic "Hello World" program using the WTO macro.
- **[ASMP0601.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0601.ASM)**: Creating a data area and performs a PUT it into a data set.
- **[ASMP0602.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0602.ASM)**: Creating a data area, which receives a text (up to 20 bytes) via PARM and performs a PUT of it into a data set.
- **[ASMP0603.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0603.ASM)**: Creating a data area, which receives a text via SYSIN and performs a loop to PUT it into a data set. Extraction of the linkage convention routines for created macros.
- **[ASMP0604.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0604.ASM)**: Receives two character-format numbers from SYSIN, converts them to decimal packed (PACK), performs addition (AP) and subtraction (SP), formats the results, and executes a PUT operation to store the results in a dataset.
- **[ASMP0605.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0605.ASM)**: Receives two character-format numbers from SYSIN, converts them to decimal packed (PACK), performs multiplication (MP) and division (DP), formats the results, and executes a PUT operation to store the results in a dataset, including the remainder of the division.
- **[ASMP0606.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0606.ASM)**: Receives two character-format numbers from SYSIN, converts them to binary (CVB), performs addition (AR) and subtraction (SR), formats and outputs the results to a dataset using PUT. Adjusts the number of decimal places (SRP).
- **[ASMP0607.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0607.ASM)**: Receives two character-format numbers from SYSIN, converts them to binary (CVB), performs addition (AR) and subtraction (SR), formats and outputs the results to a dataset using PUT. Adjusts the number of decimal places (SRP).
- **[ASMP0608.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0608.ASM)**: Implements a loop to read a KSAM file, calculates the average, and generates a report containing the following information: student name, average, and status.
- **[ASMP0609.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0609.ASM)**: Performs the same functionality as [ASMP0608.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0608.ASM), with the average calculation separated (BAS).
- **[ASMP0610.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0610.ASM)**: **HOMEWORK** - Performs the same functionality as [ASMP0609.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0609.ASM), with an additional task to generate report statistics, summarizing approved and disapproved students by gender.
- **[CPF.TXT](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/CPF.TXT)**: Logic for calculating CPF (Brazilian document similar to the Social Security Number (SSN) in the US) check digits.
- **[ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0611.ASM)**: Reads a text via PARM (CPF), performs the check of the check digit, and returns whether it is valid or not.
- **[ASMP0612.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0612.ASM)**: Exhibits the same behavior as the [ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0611.ASM), with the check digit calculation routine separated. The routine is invoked via CALL.
- **[ASMP0613.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0613.ASM)**: Exhibits the same behavior as the [ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0611.ASM), with the check digit calculation routine separated. The routine is invoked via LINK.
- **[ASMP0614.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0614.ASM)**: Exhibits the same behavior as the [ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0611.ASM), with the check digit calculation routine separated. The routine is invoked via LOAD.
- **[COBP0601.COB](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/COBP0601.COB)**: Cobol program thata invokes the routine written in assembly [ASMSCPF0.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMSCPF0.ASM).
- **[ASME0601.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASME0601.ASM)**: **EXERCISE** - Performs the same functionality as [ASMP0613.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0613.ASM), reading multiple values (CPFs) from SYSIN.
- **[ASMP0616.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0616.ASM)**: Demonstrates the use of a shared memory area (refer to the file [AREACOMM.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/AREACOMM.ASM)).
- **[ASME0602.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASME0601.ASM)**: **EXERCISE** - Read a list of [CPFs](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/CPFSIN.TXT) from a KSAM file, calculate the check digits, and save the results in a new KSAM file.
- **[ASMP0617.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0617.ASM)**: Exhibits the same behavior as [ASMP0611.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0616.ASM), leveraging a shared memory area (refer to the file [COMMAREA.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/COMMAREA.ASM)).
- **[ASMP0619.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0617.ASM)**: Reads a list of [CPFs](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/CPFSIN.TXT) and a list of students from KSAM files, replaces the student record key (enrollment) with the calculated CPF, and writes the record to a new [KSAM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ALUNOS.TXT) file.




## How to Use

1. Clone this repository using the command:
   ```bash
   git clone https://github.com/fmarqueseti/AssemblyJourneyCodeLab.git
   
## Contact

For questions or suggestions, please contact me through on GitHub or [LinkedIn](http://www.linkedin.com/in/fmrqs/) profile.
