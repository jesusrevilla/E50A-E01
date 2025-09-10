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
        assert result[0] == table

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
        WHERE id_libro IN (SELECT id FROM libros)
        AND id_miembro IN (SELECT id FROM miembros);
    """)
    count = cursor.fetchone()[0]
    assert count == 3

def test_id_fields_are_serial(db_connection):
    cursor = db_connection.cursor()
    for table in ['libros', 'miembros']:
        cursor.execute(f"""
            SELECT column_default
            FROM information_schema.columns
            WHERE table_name = '{table}' AND column_name = 'id';
        """)
        default = cursor.fetchone()[0]
        assert default is not None and 'nextval' in default, f"Campo 'id' en tabla '{table}' no es tipo serial"
