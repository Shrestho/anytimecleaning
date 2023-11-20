import React from "react";
import Loading from "../../shared/Loading";
import useCategories from "../../hooks/useCategories";

const CategoriesAll = () => {
  const { categories, loading } = useCategories();
  return (
    <div className="px-8 md:px-20 mx-auto my-20 top-margin">
      {loading ? (
        <Loading />
      ) : (
        <div className="row row-cols-1 row-cols-sm-2 row-cols-lg-4 row-cols-xl-6 g-6 w-100">
          {categories?.map((category) => (
            <div
              className="position-relative p-4 w-100 rounded-lg overflow-hidden shadow-sm d-flex flex-column justify-content-center align-items-center cursor-pointer"
              style={{ minHeight: "100px", backgroundColor: category?.color }}
              key={category?.id}
            >
              <h2 className="mt-2 text-white text-base-lg font-weight-bold overflow-hidden" style={{ textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                {category?.name}
              </h2>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default CategoriesAll;
