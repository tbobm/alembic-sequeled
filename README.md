# alembic-sequeled

Alembic but using raw SQL.

Template repository for using [alembic][alembic-latest] as a database migration
solution.

[alembic-latest]: https://alembic.sqlalchemy.org/en/latest/

## Usage

- Create a repository based on this template
- Install the required dependencies (`pip install -r requirements.txt`)
- optional: Adapt the [`script.py.mako`](./alembic/script.py.mako) template
- optional: Edit the [alembic configuration](./alembic.ini)
- Export the database URL to the `DATABASE_URL` environment variable
- Start writing your migrations

## How this repository works

Alembic is used to handle SQL-based database migrations.

It aims to provide a git-like interface to handle migrations, using concepts
like branches, head, ...

Each migration _must_ implement both an upgrade and a downgrade SQL script.
Using this repository, you may write migrations in raw SQL scripts, both for
the upgrade and downgrade operation.

In addition, you will have to generate a sha1 hash for each migration to ensure
its integrity during the migration execution.

To summarize it, each revision is made of:
- a main script (`migration_slug.py`)
- a script directory (`migration_slug`)
- an upgrade and downgrade SQL script (`migration_slug/upgrade.sql`)
- the corresponding hashes (`migration_slug/upgrade.sha1`)

## Creating a migration

First of all, make sure you have properly exporter the `DATABASE_URL` variable.

Afterwards, you will have to create a new **migration script**:

```bash
alembic revision -m "my first revision"
```

You will then have to create the upgrade and downgrade SQL migration scripts.
Create the `upgrade.sql` and `downgrade.sql` files and write your queries.

Once you finished writing your scripts, you will generate the
corresponding sha1 files using the command below.

```bash
sha1 upgrade.sql > upgrade.sha1
```
