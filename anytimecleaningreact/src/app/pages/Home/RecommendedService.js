import React from "react";
import { useNavigate } from "react-router-dom";
import Product from "../../components/Product";
import useServices from "../../hooks/useServices";
import Loading from "../../shared/Loading";

const RecommendedService = () => {
  const { products, loading } = useServices();
  const navigate = useNavigate();
  return (
    <div className="container my-24 px-6 mx-auto flex flex-col gap-10">
      <div className="mt-20 flex justify-between">
        <h2 className="text-xl font-bold">
          Recommended <span className="text-secondary">Service</span>{" "}
        </h2>
        <div className="">
          <button
            type="button"
            onClick={() => navigate("/products")}
            className="text-orange-500 text-end w-full px-4 py-2 rounded-2xl bg-orange-300 border-none bg-opacity-20"
          >
            View All
          </button>
        </div>
      </div>

      {loading ? (
        <Loading />
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 xl:grid-cols-4 gap-6 w-full">
          {products?.slice(0, 4)?.map((product) => (
            <Product key={product?.id} {...product} />
          ))}
        </div>
      )}
    </div>
  );
};

export default RecommendedService;
