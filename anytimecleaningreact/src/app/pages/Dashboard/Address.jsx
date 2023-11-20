import axios from "axios";
import Cookies from "js-cookie";
import React from "react";
import { Link } from "react-router-dom";
import RootURL from "../../components/Contants";

const Address = () => {
  const cookies = Cookies.get('api_token');

  const handleLogout = async () => {
    await axios.get(RootURL + `logout?api_token=${cookies}`)
  .then(response => {
      Cookies.remove('api_token');
      window.location.href = '/login';
    })
    .catch(error => {
      // setMessage("Failed to update!");
    });
  }

  return (
    <>
    <div className="container top-margin">
    <div className="row mb-5">
        <div className="col-md-3 sidebar">
            <Link to={"/dashboard"}>Dashboard</Link>
            <Link to={'/dashboard/orders'}>Orders</Link>
            {/* <Link className="active" to={'/dashboard/address'}>Address</Link> */}
            <Link to={'/dashboard/account'}>Account Details</Link>
            <Link onClick={handleLogout}>Logout</Link>
        </div>

        <div className="col-md-9 content">
            <h2>Address</h2>
            <p>From your account dashboard you can view your recent orders, manage your billing address, and edit your password and account details.</p>
        </div>
    </div>
    </div>

    </>
  );
};

export default Address;
