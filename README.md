# Easy-Itinerary

Easy Itinerary is a web application that helps users search for user created travel itineraries by country. The application consists of a backend built using Fastify and a frontend built using React, enabling users to explore travel itineraries by country and get specific details for each itinerary. 
<br/>
<br/>
The database features three tables: users, countries, and itineraries. Each itinerary in the itineraries table is linked to a user via the users_id foreign key and to a country via the country_id foreign key. 

## Current Features ✨
- Country search with dynamic filtering
- Display itineraries for a chosen country

## Try it out! 🚀

Follow these steps to set up the project on your local machine.

### Prerequisites

- **Node.js**
- **npm** 
- **PostgreSQL** 

### Step 1: Clone the Repository

Start by cloning the project repository from GitHub

### Step 2: Install Dependencies

cd ei-frontend <br/>
 npm install
<br/>
<br/>   
cd ../ei-backend <br/>
npm install
<br/>
### Step 4: Import SQL

SQL created for this project can be found in the docs folder.

### Step 5: Create .env file in /ei-backend
in .env add the followin: <br/>
DATABASE_URL=postgresql://localhost/easy-itinerary <br/>
PORT=10000

### Step 6: Run dev!
in /ei-backend and /ei-frontend <br/>
npm run dev
