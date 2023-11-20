import React from "react";
import Product from "../../components/Product";
import useServices from "../../hooks/useServices";
import Loading from "../../shared/Loading";

const Services = () => {
  const { products, loading } = useServices();

  return (
      <div className="container mt-5 pt-5 text-center">
    <div className="mx-auto top-margin">
      {loading ? (
        <Loading />
      ) : (
      <div className="container">
        <div className="row row-cols-2 row-cols-sm-3 row-cols-lg-3 g-4 mb-5">
          {products?.map((product,index) => (
            <div key={index} className="col">
              <Product key={product?.id} {...product} />
            </div>
          ))}
        </div>
      </div>

      )}
    </div>
      </div>
  );
};

export default Services;
