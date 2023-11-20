import React from "react";
import { useNavigate } from "react-router-dom";
import Loading from "../shared/Loading";
import useCategories from "./../hooks/useCategories";

const Categories = () => {
  const { categories, loading } = useCategories();
  const navigate = useNavigate();

  return (
    <div className="container my-24 px-6 mx-auto flex flex-col gap-10">
      <div className="mt-20 flex justify-between">
        <h2 className="text-xl font-bold">Categories</h2>
        <div className="">
          <button
            type="button"
            onClick={() => navigate("/categories")}
            className="text-orange-500 text-end w-full px-4 py-2 rounded-2xl bg-orange-300 border-none bg-opacity-20"
          >
            View All
          </button>
        </div>
      </div>
      {loading ? (
        <Loading />
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 xl:grid-cols-4 gap-6 w-full">
          {categories?.slice(0, 8)?.map((category) => (
            <div
              className="relative p-4 w-full bg-white rounded-lg overflow-hidden hover:shadow flex flex-col justify-center items-center cursor-pointer"
              style={{ minHeight: "100px", backgroundColor: category?.color }}
              key={category?.id}
            >
              <h2 className="mt-2 text-white text-base lg:text-lg font-semibold line-clamp-1">
                {category?.name}
              </h2>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default Categories;
