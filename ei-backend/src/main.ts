import "dotenv/config";

import Fastify from "fastify";
import { db } from "./services/db";
import cors from "@fastify/cors";

const app = Fastify({
  logger: true
});

app.register(cors, {
  origin: true
});

app.get("/users", async (req, res) => {
    const result = await db
        .selectFrom('users')
        .selectAll()
        .execute();
    res.send(result);
});

/* FETCHES COUNTRIES (to find country id) */
app.get("/countries", async (req, res) => {
    const result = await db
        .selectFrom('countries')
        .selectAll()
        .execute();
    res.send(result);
});

app.get("/itineraries", async (req, res) => {
    const result = await db
        .selectFrom('itineraries')
        .innerJoin('countries', 'countries.id', 'itineraries.country_id') 
        .selectAll()
        .execute();
    res.send(result);
});

/* FETCHES ITINERARIES BY COUNTRY */
app.get<{
    Params: { 
        country: string 
    };
}>('/itineraries/:country', async (req, res) => {
    const countryName = req.params.country; 
  
    try {
      const itineraries = await db
        .selectFrom('itineraries')
        .innerJoin('countries', 'countries.id', 'itineraries.country_id') 
        .innerJoin('users', 'users.id', 'itineraries.users_id') 
        .select([
          'itineraries.id as itinerary_id',
          'countries.name as country_name',
          'users.name as user_name',
          'itineraries.description',
          'itineraries.days',
          'itineraries.nights',
        ])
        .where('countries.name', '=', countryName) 
        .execute();
        
        res.send(itineraries);
    } catch (error) {
        console.error(error);
        res.status(500).send({ error: 'Failed to fetch data' });
    }
});

app.listen({ port: parseInt(process.env.PORT as string, 10) }, () => {
    console.log(`LISTENING IN PORT ${process.env.PORT}`);
  });
  
