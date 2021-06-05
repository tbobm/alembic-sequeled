"""${message}

Revision ID: ${up_revision}
Revises: ${down_revision | comma,n}
Create Date: ${create_date}

"""
import os

import hashlib

from alembic import op
${imports if imports else ""}


here = os.path.dirname(os.path.realpath(__file__))

# revision identifiers, used by Alembic.
revision = ${repr(up_revision)}
down_revision = ${repr(down_revision)}
branch_labels = ${repr(branch_labels)}
depends_on = ${repr(depends_on)}

revision_dir = f"{here}/{revision}"


def verify_hash(filename: str, sha1: str) -> bool:
    content = open(filename).read()
    file_sha1 = hashlib.sha1(content.encode("utf-8")).hexdigest()
    return file_sha1 == sha1


def process_migration(script_name: str):
    filename = f"{revision_dir}/{script_name}.sql"
    # sha1 file must be present to validate integrity fail otherwise
    sha1 = open(f"{revision_dir}/{script_name}.sha1").read().split(" ")[0]
    valid_file = verify_hash(filename, sha1)
    if not valid_file:
        raise ValueError(
            f"corrupted file {filename} does not match sha1: {sha1}"
        )

    query = "\n".join(open(filename))
    if len(query) > 0:
        op.execute(query)


def upgrade():
    process_migration("upgrade")


def downgrade():
    process_migration("downgrade")
