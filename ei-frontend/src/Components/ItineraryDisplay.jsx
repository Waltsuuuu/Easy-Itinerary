import PropTypes from "prop-types";

const ItineraryDisplay = ({ itineraries, selectedCountry }) => {
  return (
    <div>
      <h2>{selectedCountry.name}</h2>

      {itineraries.length === 0 ? <p>No itineraries found... :(</p> : null}

      <div>
        {itineraries.map((itinerary, index) => (
          <div key={index}>
            <p>{itinerary.description}</p>
            <p>
              Trip Duration: {itinerary.days} days - {itinerary.nights} nights
            </p>
            <p>Created by: {itinerary.user_name}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

ItineraryDisplay.propTypes = {
  itineraries: PropTypes.array,
  selectedCountry: PropTypes.object,
  filteredCountries: PropTypes.array,
};

export default ItineraryDisplay;
