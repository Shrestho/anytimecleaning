import image1 from '../../../assets/uploads/media-uploader/breadcrumb1619334343.png';
import { Link } from 'react-router-dom';
import React from 'react';
// import {BiCurrentLocation, BiFile, BiGift, BiMap} from "react-icons/bi";
import { AiOutlineCheckSquare } from 'react-icons/ai';

const Confirmation = () => {
  return (
    <>
      <div
        className='breadcrumb-area'
        style={{ backgroundImage: `url(${image1})` }}
      >
        <div className='container'>
          <div className='row'>
            <div className='col-lg-12'>
              <div className='breadcrumb-inner'>
                <p>Services</p>
                <h2 className='page-title'>Services</h2>
                <ul className='page-list'>
                  <li>
                    <Link to='/home'>Home</Link>
                  </li>
                  <li>Services</li>
                  <li>Residential Service</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className='md-m-5 p-5 bg-gray text-center'>
        <div className='container text-center'>
          <div>
            <h3>Confirmation</h3>
          </div>
          <div>
            <AiOutlineCheckSquare style={{ color: '#2c9bf4' }} size={100} />
            <h3>Thank You!</h3>
            <p>
              Your booking has been successfully submitted, you will receive a
              confirmation soon
            </p>
          </div>
        </div>
      </div>
    </>
  );
};
export default Confirmation;
