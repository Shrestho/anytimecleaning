import React from "react";
import Loader from "../../assets/images/loader-1.gif";

const Loading = () => {
  return (
  <div className="d-flex justify-content-center align-items-center">
    <img className="mt-5" src={Loader} alt="Loader" style={{ width: "600px", height: "600px" }} />
  </div>
  );
};

export default Loading;
