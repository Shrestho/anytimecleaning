// import image1 from "../../../assets/uploads/media-uploader/breadcrumb1619334343.png";
// import {Link} from "react-router-dom";
import React from 'react';
// import {BiCurrentLocation, BiFile, BiGift, BiMap} from "react-icons/bi";

const ConfirmBooking = (props) => {
  console.log('confirm booking:', props);
  // const { service } = props.location.state;
  // console.log("service:",service);

  return (
    <>
      <div className='md-m-5 p-5 bg-gray text-center'>
        <div className='text-center'>
          <div>
            <h3>Booking Summary</h3>
          </div>
          <div className='row'>
            <div className='col-md-2 col-lg-2'>Cost of service</div>
            <div className='col-md-2 col-lg-2'>$30.43</div>
          </div>
          <div className='row'>
            <div className='col-md-2 col-lg-2'>Quantity</div>
            <div className='col-md-2 col-lg-2'>x1</div>
          </div>
          <div className='row'>
            <div className='col-md-2 col-lg-2'>Maintenance</div>
            <div className='col-md-2 col-lg-2'>$2.0</div>
          </div>
          <div className='row'>
            <div className='col-md-2 col-lg-2'>Tax Amount</div>
            <div className='col-md-2 col-lg-2'>$2.0</div>
          </div>

          <div className='row'>
            <div className='col-md-2 col-lg-2'>Sub Amount</div>
            <div className='col-md-2 col-lg-2'>$32.43</div>
          </div>
          <div className='row'>
            <div className='col-md-2 col-lg-2'>Total Amount</div>
            <div className='col-md-2 col-lg-2'>$32.43</div>
          </div>
          <div className='d-grid gap-2 mt-5'>
            <button className='btn btn-orenge' type='button'>
              Confirm & Book Service
            </button>
          </div>
        </div>
      </div>
    </>
  );
};
export default ConfirmBooking;
