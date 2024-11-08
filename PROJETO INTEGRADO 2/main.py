
import psycopg2
import pandas as pd

#CONECTANDO AO BANCO DE DADOS
conn = psycopg2.connect (
    dbname= 'sua_base_de_dados',
    user='seu_usuario',
    password='sua_senha',
    host='localhost'
)
cursor = conn.cursor()

## CARREGAR DAODS DA TABELAS PARA DataFrames
clientes_df = pd.read_sql_query("SELECT * FROM clientes", conn)
produtos_df = pd.read_sql_query("SELECT ** FROM produtos", conn)
vendas_df = pd.read_sql_query("SELECT * FROM vendas", conn)
pagamentos_df = pd.read_sql_query("SELECT * FROM pagamentos", conn)

#CONSULTA POR NOME
def buscar_por_nome(nome):
    cursor.execute("SELECT * FROM contatos WHERE nome = %s", (nome,))
    return cursor.fetchall()

#CONSULTA POR EMAIL
def buscar_por_email(email):
    cursor.execute("SELECT * FROM contatos WHERE email = %s", (email,))
    return cursor.fetchall()

#ATUALIZAÇÃO DE INFORMAÇÕES
def atualizar_contatos(id, nome, telefone, email):
    cursor.execute("""
        UPDATE contatos
        SET nome = %s, telefone = %s, email = %s
        WHERE id = %s
    """, (nome, telefone, email, id))
    conn.commit()

#EXPORTANDO DADOS PARA O POWER BI
def exportar_para_csv():
    df = pd.read_sql_query("SELECT * FROM contatos", conn)
    df.to_csv('contatos.csv', index=False)

#EXEMPLO DE USO
print(buscar_por_nome('Richard Kaue'))
print(buscar_por_email('richardkaue99@gmail.com'))
atualizar_contatos(1, 'Richard Kaue','1234-5678', 'richardkaue99@gmail.com')
exportar_para_csv()

#FECHAR A CONEXÃO
print(clientes_df.head())
print(produtos_df.head())
print(vendas_df.head())
print(pagamentos_df.head())
cursor.close()
conn.close()



