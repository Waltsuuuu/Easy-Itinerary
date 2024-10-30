import { useEffect, useState } from "react";
import axios from "axios";
import CountrySeach from "./Components/CountrySearch";
import ItineraryDisplay from "./Components/ItineraryDisplay";
import CountryFilter from "./Components/CountryFilter";
import HomeDisplay from "./Components/HomeDisplay";
import "./App.css";

function App() {
  const [userQuery, setUserQuery] = useState(""); // user input
  const [countries, setCountries] = useState([]); // list of countries
  const [filteredCountries, setFilteredCountries] = useState([]); // filtered list of countries
  const [selectedCountry, setSelectedCountry] = useState(null); // selected country
  const [isSearching, setIsSearching] = useState(false);
  const [itineraries, setItineraries] = useState([]); // list of itineraries

  // fetch countries from API
  useEffect(() => {
    axios
      .get("http://127.0.0.1:10000/countries")
      .then((response) => setCountries(response.data))
      .catch((error) => console.error(error));
  }, []);

  // fetch itineraries from API
  useEffect(() => {
    if (selectedCountry && selectedCountry.name) {
      axios
        .get(`http://127.0.0.1:10000/itineraries/${selectedCountry.name}`)
        .then((response) => setItineraries(response.data))
        .catch((error) => console.error(error));
    }
  }, [selectedCountry]);

  const handleSearch = (event) => {
    const searchQuery = event.target.value.toLowerCase();
    setUserQuery(searchQuery);
    setIsSearching(true);

    const matchingCountries = countries.filter((country) =>
      country.name.toLowerCase().includes(searchQuery)
    );

    const matchingCountry = matchingCountries[0];

    if (searchQuery === "") {
      setFilteredCountries([""]);
    } else if (matchingCountries.length > 10) {
      setFilteredCountries(["Too many countries match search"]);
      setSelectedCountry(null);
    } else if (matchingCountries.length === 0) {
      setFilteredCountries(["No countries match search"]);
      setSelectedCountry(null);
    } else if (matchingCountries.length === 1) {
      setFilteredCountries(matchingCountries);
      setSelectedCountry(matchingCountry);
    } else {
      setFilteredCountries(matchingCountries.slice(0, 10));
      setSelectedCountry(null);
    }
  };

  const handleShow = (country) => {
    setSelectedCountry(country);
    setUserQuery("");
  };

  const handleGoHome = () => {
    setIsSearching(false);
    setSelectedCountry(null);
    setUserQuery("");
  };

  console.log(itineraries);

  return (
    <div>
      <h1 onClick={handleGoHome}>Easy Itinerary</h1>
      <CountrySeach 
        userQuery={userQuery} 
        handleSearch={handleSearch} 
      />

      {!isSearching ? (
        <HomeDisplay />
      ) : (
        <div>
          {selectedCountry ? (
            <ItineraryDisplay
              itineraries={itineraries}
              selectedCountry={selectedCountry}
              filteredCountries={filteredCountries}
            />
          ) : (
            <CountryFilter
              filteredCountries={filteredCountries}
              handleShow={handleShow}
            />
          )}
        </div>
      )}
    </div>
  );
}

export default App;
