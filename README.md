# ![carteira-de-identidade](https://github.com/ThailanyP/momentos-e-seus-funcionarios/assets/111004514/c801ba60-33f1-4a87-a2d1-fd94e6ede2c0) Momentos e seus funcionários
A Momento é uma empresa única que faz o melhor que pode para alcançar o melhor da humanidade. 
Na sua cabeça... 

Então, vamos criar momentos!
<br>
<br>
1- Inclua suas próprias informações no departamento de tecnologia da empresa.*

```sql
INSERT INTO funcionarios (primeiro_nome, sobrenome, email, telefone, dataContratacao, ocupacao_id, salario, gerente_id, departamento_id) 
VALUES ('Thailany', 'Pereira', 'thailanypereira@exemplo.com', '11912345678', '2023-07-01', '9', '4000.00', '103', '6');
```

2- A administração está sem funcionários. Inclua os outros elementos do seu grupo do demoday no departamento de administração.

```sql
INSERT INTO funcionarios (primeiro_nome, sobrenome, email, telefone, dataContratacao, ocupacao_id, salario, gerente_id, departamento_id) 
VALUES ('Gabriela', 'Souza', 'gabrielasouza@exemplo.com', '11998745612', '2023-07-01', '8', '4000.00', '101', '4'),
('Kevyn', 'Aciole', 'kevynaciole@exemplo.com', '11915937462', '2023-07-01', '15', '10000.00', '201', '11'),
('Vinicius', 'Costa', 'viniciuscosta@exemplo.com', '11985207416', '2023-07-01', '9', '9500.00', '103', '6'),
('Rafael', 'Viana', 'rafelviana@exemplo.com', '11903692587', '2023-07-01', '9', '5000.00', '103', '6'),
('Matheus', 'Passos', 'matheuspassos', '11946825791', '2023-07-01', '11', '4500.00', '201', '2'),
('Matheus', 'Assis', 'matheusassis@exemplo.com', '11912345678', '2023-07-01', '10', '9000.00', '100', '2');
```

3- Agora diga, quantos funcionários temos ao total na empresa?

```sql
SELECT COUNT(*) FROM funcionarios;  
47 funcionários
```

4 - Quantos funcionários temos no departamento de finanças?

```sql
SELECT COUNT(*) FROM funcionarios WHERE departamento_id = '10';  6 funcionários
```

5 - Qual a média salarial do departamento de tecnologia?

```sql
SELECT ROUND(AVG(salario)) from funcionarios WHERE departamento_id LIKE '%6%' ;  5982
```

6 - Quanto o departamento de Transportes gasta em salários?

```sql
SELECT SUM(salario) from funcionarios WHERE departamento_id LIKE '%5%'; 41200.00
```

7 - Um novo departamento foi criado. O departamento de inovações. Ele será locado no Brasil. Por favor, adicione-o no banco de dados.*

```sql
INSERT INTO departamento (departamento_name, posicao_id) 
VALUES ('inovações', '5400');
```

**8 - Novos Funcionários!**

Três novos funcionários foram contratados para o departamento de inovações. Por favor, adicione-os: William Ferreira, casado com Inara Ferreira, possui um filho chamado Gabriel que tem 4 anos e adora brincar com cachorros. Ele será programador.Já a Fernanda Lima, que é casada com o Rodrigo, não possui filhos. Ela vai ocupar a posição de desenvolvedora.  Por último, a Gerente do departamento será Fabiana Raulino. Casada, duas filhas (Maya e Laura). O salário de todos eles será a média salarial dos departamentos de administração e finanças.

Query com a resposta*

```sql
INSERT INTO funcionarios (primeiro_nome, sobrenome, email, telefone, dataContratacao, ocupacao_id, salario, gerente_id, departamento_id) 
VALUES ('William', 'Ferreira', 'email@exemplo.com', '944446554', '2023-07-01', 20, 4500.00, 202, 13);

INSERT INTO funcionarios (primeiro_nome, sobrenome, email, telefone, dataContratacao, ocupacao_id, salario, gerente_id, departamento_id) 
VALUES ('Fernanda', 'Lima', 'email@exemplo.com', '988447632', '2023-07-01',21, 4500.00,202, 12);

INSERT INTO funcionarios (primeiro_nome, sobrenome, email, telefone, dataContratacao, ocupacao_id, salario, gerente_id, departamento_id) 
VALUES ('Fabiana', 'Raulino', 'email@exemplo.com', 'telefone', '2023-07-01', 22, 3500.00, 202, 12);
INSERT INTO dependentes (primeiro_nome, sobrenome, parentesco, funcionario_id) 
VALUES ('Gabriel', 'Ferreira', 'Filho', 233);
INSERT INTO dependentes (primeiro_nome, sobrenome, parentesco, funcionario_id) 
VALUES ('Inara', 'Ferreira', 'Cônjuge', 233);
INSERT INTO dependentes (primeiro_nome, sobrenome, parentesco, funcionario_id) 
VALUES ('Rodrigo', 'Lima', 'Cônjuge', 234);
INSERT INTO dependentes (primeiro_nome, sobrenome, parentesco, funcionario_id) 
VALUES ('Maya', 'Raulino', 'Filha', 234);

INSERT INTO dependentes (primeiro_nome, sobrenome, parentesco, funcionario_id) 
VALUES ('Laura', 'Raulino', 'Filha', 234);
```

9 - Informe todas as regiões em que a empresa atua acompanhadas de seus países.*

```sql
**SELECT r.regiao_name, p.pais_name
FROM regiao r
INNER JOIN paises p ON r.regiao_id = p.regiao_id;**
```

**Filho de quem?**

10 - Joe Sciarra é filho de quem?*

```sql
SELECT f.primeiro_nome, f.sobrenome
FROM funcionarios f
JOIN dependentes d ON f.funcionario_id = d.funcionario_id
WHERE d.primeiro_nome = 'Joe' AND d.sobrenome = 'Sciarra';

Ismael Sciarra
```

11 - Jose Manuel possui filhos?*

```sql
SELECT COUNT(*) FROM dependentes WHERE parentesco = 'Filho' 
AND funcionario_id = (SELECT funcionario_id FROM funcionarios WHERE primeiro_nome = 'Jose' AND sobrenome = 'Manuel');

Não
```

12 - Qual região possui mais países?*

```sql
SELECT r.regiao_name, COUNT(*) AS total_paises
FROM regiao r
INNER JOIN paises p ON r.regiao_id = p.regiao_id
GROUP BY r.regiao_name
ORDER BY total_paises DESC
LIMIT 1;
```

13 - Exiba o nome cada funcionário acompanhado de seus dependentes.*

```sql
SELECT f.primeiro_nome, f.sobrenome, d.primeiro_nome AS dependente_nome, d.parentesco
FROM funcionarios f
LEFT JOIN dependentes d ON f.funcionario_id = d.funcionario_id;
```

14 - Karen Partners possui um cônjuge?*

```sql
SELECT COUNT(*) FROM dependentes WHERE parentesco = 'Cônjuge' AND funcionario_id = (SELECT funcionario_id FROM funcionarios WHERE primeiro_nome = 'Karen' AND sobrenome = 'Partners');
não
```

15 - O ID da tabela de países não segue um padrão numérico. Na sua visão, qual o impacto disso no desenvolvimento do banco?*

```sql
Não seguir um padrão numérico pode ter um impacto na forma como as consultas e junções são realizadas.
```

**Parabéns!**

Por ter feito um ótimo trabalho, você acaba de ser promovido. Você terá seu próprio departamento em algum dos países que a empresa já atua.

16 - Escolha um país para se mudar. Qual seria esse país? Por que escolheria esse país? E o departamento. O que seria? Como seriam seus funcionários?*

```sql
SELECT pais_id, pais_name
FROM paises
WHERE pais_name = 'Brasil';

INSERT INTO departamento (departamento_name, posicao_id)
VALUES ('Design', 5400);

UPDATE funcionarios
SET departamento_id = (SELECT departamento_id FROM departamento WHERE departamento_name = 'Design')
WHERE funcionario_id = 224;
```

17 - Atualize as informações na tabela para que seu departamento seja criado.*

```sql
UPDATE funcionarios SET departamento_id = 13 WHERE funcionario_id = 224;
```
