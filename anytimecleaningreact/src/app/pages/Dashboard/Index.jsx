import Cookies from 'js-cookie';
import React, { useEffect, useReducer, useState } from 'react';
import { Link } from 'react-router-dom';
import RootURL from '../../components/Contants';
import axios from 'axios';

const Dashboard = () => {
  const cookies = Cookies.get('api_token');
  // eslint-disable-next-line no-unused-vars
  const [message, setMessage] = useState('');

  const [state, setState] = useReducer(
    (state, newState) => ({ ...state, ...newState }),
    {
      id: '',
      name: '',
      email: '',
    }
  );

  useEffect(() => {
    const getUserData = async () => {
      await fetch(RootURL + `user?api_token=${cookies}`)
        .then((res) => res.json())
        .then((data) => {
          setState({
            id: data?.data?.id,
            name: data?.data?.name,
            email: data?.data?.email,
          });
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
            <Link className='active' to={'/dashboard'}>
              Dashboard
            </Link>
            <Link to={'/dashboard/orders'}>Orders</Link>
            {/* <Link to={'/dashboard/address'}>Address</Link> */}
            <Link to={'/dashboard/account'}>Account Details</Link>
            <Link onClick={handleLogout}>Logout</Link>
          </div>

          <div className='col-md-9 content'>
            <h2>
              Hello {state?.name} (not {state?.name}?{' '}
              <Link onClick={handleLogout}>Log out</Link>)
            </h2>
            <p>
              From your account dashboard you can view your recent orders,
              manage your billing address, and edit your password and account
              details.
            </p>
          </div>
        </div>
      </div>
    </>
  );
};

export default Dashboard;
