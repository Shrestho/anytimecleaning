import React from "react";

const Category = ({ name, color, order, description }) => {
  return (
    <div
      className={`md:flex shadow-lg  mx-6 md:mx-auto max-w-lg md:max-w-2xls rounded-lg`}
      style={{ backgroundColor: color }}
    >
      <div className={`w-full md:w-2/3 px-4 py-4 rounded-lg`}>
        <h2 className="text-lg text-gray-800 font-medium mr-auto">{name}</h2>
      </div>
    </div>
  );
};

export default Category;
