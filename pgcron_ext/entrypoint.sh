#!/bin/bash
set -e

# Modify postgresql.conf
sed -i "s/^#shared_preload_libraries = 'pg_cron'/shared_preload_libraries = 'pg_cron'/" /var/lib/postgresql/data/postgresql.conf


# Ensure proper ownership and permissions for PostgreSQL
chown -R postgres:postgres /var/lib/postgresql/data
chmod 700 /var/lib/postgresql/data

# Start PostgreSQL as the 'postgres' user
su-exec postgres "$@"
