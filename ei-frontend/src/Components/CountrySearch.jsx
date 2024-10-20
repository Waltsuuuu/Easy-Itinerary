import PropTypes from "prop-types";

const CountrySearch = ({ userQuery, handleSearch }) => {
  return (
    <div>
      <div>
        <input
          type="text"
          placeholder="Search for a country"
          value={userQuery}
          onChange={handleSearch}
        />
      </div>
    </div>
  );
};

CountrySearch.propTypes = {
  userQuery: PropTypes.string,
  handleSearch: PropTypes.func,
};

export default CountrySearch;
