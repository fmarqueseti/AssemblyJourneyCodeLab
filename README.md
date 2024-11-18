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
- **[ASMP0609.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0609.ASM)**: 
Mesmo comportamento que o [ASMP0608.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0608.ASM), tendo sido separado o cálculo da média (BAS).
- **[ASMP0610.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0610.ASM)**: 
**DEVER DE CASA** - Mesmo comportamento que o [ASMP0610.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0610.ASM), ao final, imprimir estatísticas do relatório totalizando, por gênero, os aprovados e reprovados.

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
- **[ASMP0605.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0605.ASM)**:  Receives two character-format numbers from SYSIN, converts them to decimal packed (PACK), performs multiplication (MP) and division (DP), formats the results, and executes a PUT operation to store the results in a dataset, including the remainder of the division.
- **[ASMP0606.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0606.ASM)**: Receives two character-format numbers from SYSIN, converts them to binary (CVB), performs addition (AR) and subtraction (SR), formats and outputs the results to a dataset using PUT. Adjusts the number of decimal places (SRP).
- **[ASMP0607.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0607.ASM)**: Receives two character-format numbers from SYSIN, converts them to binary (CVB), performs addition (AR) and subtraction (SR), formats and outputs the results to a dataset using PUT. Adjusts the number of decimal places (SRP).
- **[ASMP0608.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0608.ASM)**: Implements a loop to read a KSAM file, calculates the average, and generates a report containing the following information: student name, average, and status.
- **[ASMP0609.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0609.ASM)**: Performs the same functionality as [ASMP0608.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0608.ASM), with the average calculation separated (BAS).
- **[ASMP0610.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0610.ASM)**: 
**HOMEWORK** - Performs the same functionality as [ASMP0609.ASM](https://github.com/fmarqueseti/AssemblyJourneyCodeLab/blob/main/ASMP0609.ASM), with an additional task to generate report statistics, summarizing approved and disapproved students by gender.

## How to Use

1. Clone this repository using the command:
   ```bash
   git clone https://github.com/fmarqueseti/AssemblyJourneyCodeLab.git
   
## Contact

For questions or suggestions, please contact me through on GitHub or [LinkedIn](http://www.linkedin.com/in/fmrqs/) profile.
