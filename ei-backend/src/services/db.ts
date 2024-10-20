import { Kysely, PostgresDialect } from "kysely";
import { DB } from "kysely-codegen";
import pg from "pg";

const { Pool } = pg;

export const db = new Kysely<DB>({
  dialect: new PostgresDialect({
    pool: new Pool({
      connectionString: process.env.DATABASE_URL
    })
  })
});