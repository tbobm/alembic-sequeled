# alembic-sequeled

Alembic but using raw SQL.

Template repository for using [alembic][alembic-latest] as a database migration
solution.

[alembic-latest]: https://alembic.sqlalchemy.org/en/latest/

## Usage

- Create a repository based on this template
- optional: Adapt the [`script.py.mako`](./alembic/script.py.mako) template
- Export the database URL to the `DATABASE_URL` environment variable
- Start writing your migrations !
