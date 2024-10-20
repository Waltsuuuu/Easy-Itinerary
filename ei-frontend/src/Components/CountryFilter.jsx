import PropTypes from "prop-types";

const CountryFilter = ({ filteredCountries, handleShow }) => {
  const isMessage =
    filteredCountries.length === 1 && typeof filteredCountries[0] === "string";

  return (
    <div>
      <div className="search-suggestion-list">
        {isMessage ? (
          <p>{filteredCountries[0]}</p>
        ) : (
          <div>
            {filteredCountries.map((country, index) => (
              <p className="suggested-country" key={index}>
                {country.name}
                <button onClick={() => handleShow(country)}>Select</button>
              </p>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

CountryFilter.propTypes = {
  filteredCountries: PropTypes.array,
  handleShow: PropTypes.func,
};

export default CountryFilter;
