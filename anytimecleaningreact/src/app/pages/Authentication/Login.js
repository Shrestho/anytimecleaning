import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import './Login.css';
import RootURL from '../../components/Contants';
import Cookies from 'js-cookie';
// import { useLocation } from 'react-router-dom';

const Login = () => {
  const cookies = Cookies.get("api_token");

  // const location = useLocation();
  // console.log('location:', localStorage.getItem('prevPath'));
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  //   const [redirect, setRedirect] = useState(false);
  // eslint-disable-next-line no-unused-vars
  const [token, setToken] = useState('');
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
      if(cookies ){
        if(localStorage.getItem('prevPath')){
          window.location.href = localStorage.getItem('prevPath');
        }else{
          window.location.href ='/dashboard';
        }
      }
  }, [cookies]);

  const submitHandler = async (e) => {
    e.preventDefault();
    await fetch(RootURL + 'login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      body: JSON.stringify({ email, password }),
    })
      .then((res) => res.json())
      .then((info) => {
        // console.log(info);
        // console.log(info.data.api_token);
        if (info?.data?.api_token) {
          setToken(info.data.api_token);
          Cookies.set('api_token', info.data.api_token);
          // window.location.href = '/dashboard';
          // console.log('prec path:', prevPath);
          const prevPath = localStorage.getItem('prevPath') || '/';
          window.location.href = prevPath ? prevPath : '/dashboard';
        } else {
          setErrorMessage('Incorrect email or password!');
        }
      });
  };
  return (
    <div className='login'>
      <div className='container-fluid h-100 custom'>
        <div className='row justify-content-center align-items-center h-100'>
          <div className='col-md-4 login-form'>
            <h2 className='text-center'>Login</h2>
            {errorMessage && (
              <div className='p-3 m-3 text-white bg-danger'>{errorMessage}</div>
            )}
            <form>
              <div className='form-group'>
                <label htmlFor='Email'>Email:</label>
                <input
                  type='text'
                  className='form-control'
                  name='email'
                  id='email'
                  placeholder='Enter email'
                  onChange={(e) => setEmail(e.target.value)}
                />
              </div>
              <div className='form-group'>
                <label htmlFor='password'>Password:</label>
                <input
                  type='password'
                  className='form-control'
                  name='password'
                  id='password'
                  placeholder='Enter password'
                  onChange={(e) => setPassword(e.target.value)}
                />
              </div>
              <div className='text-center'>
                <button
                  type='submit'
                  className='btn btn-primary mx-auto'
                  onClick={submitHandler}
                >
                  Submit
                </button>
              </div>
            </form>
            <p className='text-center m-4'>
              Don't have an account?{' '}
              <Link to='/user-signup' style={{ color: 'blue' }}>
                Register
              </Link>
            </p>
            <p className='text-center'>
              Provider?{' '}
              <a href='https://api.anytimecleaning.net/public/login'>
                Login here.
              </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};
export default Login;
