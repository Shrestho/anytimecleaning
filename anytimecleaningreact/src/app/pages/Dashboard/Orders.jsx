import moment from 'moment';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
// import useOrders from "../../hooks/dashboard/useOrders";
import Cookies from 'js-cookie';
import axios from 'axios';
import RootURL from '../../components/Contants';

const Orders = () => {
  const cookies = Cookies.get('api_token');
  const [orders, setOrders] = useState('');
  // eslint-disable-next-line no-unused-vars
  const [message, setMessage] = useState('');
  console.log('orders:', orders);

  useEffect(() => {
    const getUserData = async () => {
      await axios
        .get(RootURL + `bookings`, {
          headers: {
            Authorization: 'Bearer ' + cookies,
          },
        })
        .then((response) => {
          setOrders(response?.data?.data);
        })
        .catch((error) => {
          setMessage('Failed to update!');
        });
    };
    getUserData();
  }, [cookies]);

  const handleLogout = async () => {
    await axios
      .get(RootURL + `logout?api_token=${cookies}`)
      .then((response) => {
        Cookies.remove('api_token');
        window.location.href = '/login';
      })
      .catch((error) => {
        setMessage('Failed to update!');
      });
  };

  return (
    <>
      <div className='container top-margin'>
        <div className='row mb-5'>
          <div className='col-md-3 sidebar'>
            <Link to={'/dashboard'}>Dashboard</Link>
            <Link className='active' to={'/dashboard/orders'}>
              Orders
            </Link>
            {/* <Link to={'/dashboard/address'}>Address</Link> */}
            <Link to={'/dashboard/account'}>Account Details</Link>
            <Link onClick={handleLogout}>Logout</Link>
          </div>

          <div className='col-md-9 content'>
            <h2>Orders</h2>

            <div className='table-responsive'>
              <table className='table table-striped table-bordered table-hover'>
                <thead>
                  <tr>
                    <th>Service</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Status</th>
                    <th>Duration</th>
                    <th>Booking at</th>
                  </tr>
                </thead>
                <tbody>
                  {orders &&
                    orders.map((order, index) => (
                      <tr key={index}>
                        <td>{order?.e_service?.name.en}</td>
                        <td>{order?.e_service?.price}</td>
                        <td>{order?.quantity}</td>
                        <td>{order?.booking_status?.status}</td>
                        <td>{order?.duration}</td>
                        <td>
                          {moment(order?.booking_at).format('DD MMMM YY')}
                        </td>
                      </tr>
                    ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Orders;
