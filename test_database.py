import psycopg2
import pytest

@pytest.fixture(scope="module")
def db_connection():
    conn = psycopg2.connect(
        dbname="testdb",
        user="postgres",
        password="postgres",
        host="localhost",
        port="5432"
    )
    yield conn
    conn.close()

def test_tables_exist(db_connection):
    cursor = db_connection.cursor()
    for table in ['libros', 'miembros', 'prestamos']:
        cursor.execute(f"SELECT to_regclass('{table}');")
        result = cursor.fetchone()
        assert result[0] is not None, f"La tabla {table} no existe"

def test_libros_data(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM libros;")
    count = cursor.fetchone()[0]
    assert count == 3

def test_miembros_data(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM miembros;")
    count = cursor.fetchone()[0]
    assert count == 2

def test_prestamos_relations(db_connection):
    cursor = db_connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) FROM prestamos
        WHERE id_libro IN (SELECT id_libro FROM libros)
        AND id_miembro IN (SELECT id_miembro FROM miembros);
    """)
    count = cursor.fetchone()[0]
    assert count == 3

def test_id_fields_are_serial(db_connection):
    cursor = db_connection.cursor()
    ids = {"libros": "id_libro", "miembros": "id_miembro", "prestamos": "id_prestamo"}
    for table, col in ids.items():
        cursor.execute(f"""
            SELECT column_default
            FROM information_schema.columns
            WHERE table_name = '{table}' AND column_name = '{col}';
        """)
        default = cursor.fetchone()[0]
        assert default is not None and 'nextval' in default, f"Campo '{col}' en tabla '{table}' no es tipo serial"

def test_at_least_one_not_null_column(db_connection):
    cursor = db_connection.cursor()
    for table in ['libros', 'miembros', 'prestamos']:
        cursor.execute(f"""
            SELECT COUNT(*) FROM information_schema.columns
            WHERE table_name = '{table}' AND is_nullable = 'NO';
        """)
        count = cursor.fetchone()[0]
        assert count >= 1, f"La tabla '{table}' no tiene ninguna columna NOT NULL"
