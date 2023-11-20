import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import Cookies from 'js-cookie';
import RootURL from '../../components/Contants';
import { useReducer } from 'react';
import axios from 'axios';

const Account = () => {
  const cookies = Cookies.get('api_token');
  const [message, setMessage] = useState('');
  const [state, setState] = useReducer(
    (state, newState) => ({ ...state, ...newState }),
    {
      id: '',
      name: '',
      email: '',
      phone_number: '',
      address: '',
      bio: '',
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
            phone_number: data?.data?.phone_number,
            address: data?.data?.custom_fields?.address.value,
            bio: data?.data?.custom_fields?.bio.value,
          });
        });
    };
    getUserData();
  }, [cookies]);

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setState({ ...state, [name]: value });
  };

  const handleSubmit = async () => {
    // eslint-disable-next-line no-unused-vars
    const res = await axios
      .post(RootURL + `users/${state.id}`, state, {
        headers: {
          Authorization: 'Bearer ' + cookies,
        },
      })
      .then((response) => {
        setMessage(response?.data?.message);
      })
      .catch((error) => {
        setMessage('Failed to update!');
      });
  };

  useEffect(() => {
    const timer = setTimeout(() => {
      setMessage('');
    }, 5000);

    return () => clearTimeout(timer);
  }, [message]);

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
            <Link to={'/dashboard/orders'}>Orders</Link>
            {/* <Link to={'/dashboard/address'}>Address</Link> */}
            <Link className='active' to={'/dashboard/account'}>
              Account Details
            </Link>
            <Link onClick={handleLogout}>Logout</Link>
          </div>

          <div className='col-md-9 content'>
            {message && (
              <div className='p-3 m-3 text-white bg-success'>{message}</div>
            )}
            <h2>Account Details</h2>
            <p>
              From your account dashboard you can view your recent orders,
              manage your billing address, and edit your password and account
              details.
            </p>

            <div>
              <div className='row'>
                <div className='form-group col-md-6'>
                  <label htmlFor='input1'>Name</label>
                  <input
                    name='name'
                    value={state?.name}
                    type='text'
                    className='form-control'
                    id='input1'
                    aria-describedby='emailHelp'
                    placeholder='Enter Name'
                    onChange={handleInputChange}
                  />
                </div>
                <div className='form-group col-md-6'>
                  <label htmlFor='input2'>Email address</label>
                  <input
                    name='email'
                    value={state?.email}
                    type='email'
                    className='form-control'
                    id='input2'
                    aria-describedby='emailHelp'
                    placeholder='Enter email'
                    onChange={handleInputChange}
                  />
                </div>
              </div>
              <div className='row'>
                <div className='form-group col-md-6'>
                  <label htmlFor='input3'>Phone</label>
                  <input
                    name='phone_number'
                    value={state?.phone_number}
                    type='text'
                    className='form-control'
                    id='input3'
                    aria-describedby='emailHelp'
                    placeholder='Enter Phone Number'
                    onChange={handleInputChange}
                  />
                </div>
                <div className='form-group col-md-6'>
                  <label htmlFor='input4'>Address</label>
                  <input
                    name='address'
                    value={state.address}
                    type='text'
                    className='form-control'
                    id='input4'
                    aria-describedby='emailHelp'
                    placeholder='Enter Address'
                    onChange={handleInputChange}
                  />
                </div>
              </div>
              <div>
                <div className='form-group'>
                  <label htmlFor='exampleFormControlTextarea1'>Bio</label>
                  <textarea
                    name='bio'
                    value={state.bio}
                    onChange={handleInputChange}
                    className='form-control'
                    id='exampleFormControlTextarea1'
                    rows='3'
                  ></textarea>
                </div>
              </div>
              <div className='d-flex justify-content-end'>
                <button
                  onClick={handleSubmit}
                  type='submit'
                  className='btn btn-primary px-5 py-2'
                >
                  Submit
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Account;
