import image1 from '../../../assets/uploads/media-uploader/breadcrumb1619334343.png';
import { Link, useParams } from 'react-router-dom';
import axios from 'axios';
import RootURL from '../../components/Contants';
import React,{ Fragment, useEffect, useState }from 'react';
import { BiCurrentLocation, BiFile, BiGift, BiMap } from 'react-icons/bi';
// import ConfirmBooking from '../../components/Booking/ConfirmBooking';
// import useBooking from "../../hooks/useBooking";
import moment from 'moment/moment';
import Cookies from 'js-cookie';
import { Dialog, Transition } from '@headlessui/react'
import {loadStripe} from '@stripe/stripe-js';
import {
  CardElement,
  Elements,
  useStripe,
  useElements,
} from '@stripe/react-stripe-js';
import { PayPalScriptProvider, PayPalButtons } from "@paypal/react-paypal-js";
import AddPayment from '../../components/Payment/AddPayment';

const Booking = () => {
  const { id } = useParams();
  const cookies = Cookies.get('api_token');
  // const stripe = new Stripe('sk_test_51LPIPWB1kF8HAmvfcoEXCOj06Jw35GdKW2uUpSsgZaGT2cZwNnjvevB4MDlzv2FqrYkdzZMena6fotQBqc2wdkmo00pvj6s2Bl');
  const stripePromise = loadStripe('pk_test_51LPIPWB1kF8HAmvf0qMGYdXYGd2jJ4t0fUYqPMBSzc5myAUjcZb957bbcewISXEa5jk5XI8yX0MaxRvTnUdWIyc100Xzmg4NFZ');
  // const stripe = useStripe()
  const [coupon, setCoupon] = useState(null);
  const [addressForm, setAddressForm] = useState(false);
  const [message, setMessage] = useState('');
  const [errorMethod, setErrorMethod] = useState('');
  const [clientSecret,setClientSecret]=useState('');
  const [service, setService] = useState('');
  const [booking, setBooking] = useState('');
  console.log("booking:",booking);
  let [paymentForm, setPaymentForm] = useState(false);
  const [selectedMethod, setSelectedMethod] = useState();
  console.log("selected method:",selectedMethod);
  const [methods, setMethods] = useState('');

  // const [user, setUser] = useState('');
  // console.log("user:",user)
  const [showConfirm, setShowConfirm] = useState(false);
  const [messageCoupon, setMessageCoupon] = useState('');
  const [errorCoupon, setErrorCoupon] = useState('');
  const [options, setOptions] = useState(null);
  console.log('options:', options);
  const [bookingStatuses, setBookingStatuses] = useState(null);
  console.log('booking status:', bookingStatuses);

  const [user, setUser] = useState({
    id: '',
    name: '',
    email: '',
    phone_number: '',
    address: '',
    bio: '',
  });

  const [bookingData, setBookingData] = useState({
    address: {
      address: user?.address,
      longitude: '0',
      latitude: '0',
      user_id: user?.id,
    },
    user_id: user?.id,
    e_service: id,
    options: [],
    coupon_id: '',
    booking_status_id: 2,
    taxes: '',
    payment_id: '',
    booking_at: new Date().toISOString(),
    hint: '',
  });
  console.log('bookingData', bookingData);

  useEffect(() => {
    if(cookies){
      localStorage.removeItem('prevPath');
    }

    const getUserData = async () => {
      await fetch(RootURL + `user?api_token=${cookies}`)
        .then((res) => res.json())
        .then((data) => {
          setUser({
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
    const getService = async () => {
      await axios
        .get(RootURL + `e_services/${id}`, {
          headers: {
            Authorization: 'Bearer ' + cookies,
          },
        })
        .then((response) => {
          setService(response?.data?.data);
        })
        .catch((error) => {
          // setMessage("Failed to update!");
        });
    };
    getService();
    getOptions();
    getMethods();
    getBookingStatuses();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [coupon, cookies, id]);

  useEffect(() => {
    setBookingData({ ...bookingData, address: {...bookingData.address,address:user.address, user_id:user.id} });
  }, [user]);

  const getCoupons = async () => {
    await axios
      .get(RootURL + `coupons`, {
        headers: {
          Authorization: 'Bearer ' + cookies,
        },
      })
      .then((response) => {
        const valid_coupon = response?.data?.data.find((value) => {
          return value.code === coupon;
        });
        if (valid_coupon) {
          setMessageCoupon('Coupon added Successfully!');
          setBookingData({ ...bookingData, coupon_id: valid_coupon?.id });
        } else {
          setErrorCoupon('Invalid Coupon!');
        }
      })
      .catch((error) => {});
  };

  const getOptions = async () => {
    await axios
      .get(RootURL + `options`, {
        headers: {
          Authorization: 'Bearer ' + cookies,
        },
      })
      .then((response) => {
        setOptions(response?.data?.data);
      })
      .catch((error) => {});
  };

  const getMethods = async () => {
    await axios
      .get(RootURL + `payment_methods`, {
        headers: {
          Authorization: 'Bearer ' + cookies,
        },
      })
      .then((response) => {
        const enable_method = response?.data?.data.filter((value) => value.enabled);
        setMethods(...methods,enable_method);
      })
      .catch((error) => {});
  };

    const setPayment = async() =>{
        await axios
      .post(RootURL + `payment`, {id:bookingData?.id,payment_method_id:selectedMethod}, {
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

      // create wallets
      await axios
      .post(RootURL + `wallets`, {name: "My USD Wallet for booking", user: user?.id}, {
      headers: {
          Authorization: 'Bearer ' + cookies,
      },
      })
      .then((response) => {
      })
      .catch((error) => {
      setMessage('Failed to create wallets!');
      });
    }

  const getBookingStatuses = async () => {
    await axios
      .get(RootURL + `booking_statuses`, {
        headers: {
          Authorization: 'Bearer ' + cookies,
        },
      })
      .then((response) => {
        setBookingStatuses(response?.data?.data);
      })
      .catch((error) => {});
  };

  const getPaymentIntent = async () => {
    await axios
      .post(RootURL + `create-payment-intent`,{amount: Math.round((service?.price) * 100),currency:"CAD"}, {
        headers: {
          Authorization: 'Bearer ' + cookies,
        },
      })
      .then((response) => {
        // console.log("payment-intent:",response?.data?.data);
        setClientSecret(response?.data?.data);
      })
      .catch((error) => {});
  };

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    if(name==="address"){
      setUser({...user, address:value});
      setBookingData({ ...bookingData, address:{...bookingData.address,address:value} });
    }else{
      setBookingData({ ...bookingData, [name]: value });
    }
  };

  const getBooking= async (booking_id) => {
    await axios
      .get(RootURL + `bookings/${booking_id}`, {
        headers: {
          Authorization: 'Bearer ' + cookies,
        },
      })
      .then((response) => {
        setBooking(response?.data?.data);
      })
      .catch((error) => {});
  };

  const submitHandler = async (event) => {
        event.preventDefault();
        if(selectedMethod){

        // create booking
        await axios
        .post(RootURL + `bookings`, bookingData, {
          headers: {
            Authorization: 'Bearer ' + cookies,
          },
        })
        .then((response) => {
          console.log("submit booking res:",response)
          setBooking(response?.data?.data);
          getBooking(response?.data?.data?.id);
          setMessage(response?.data?.message);
          setAddressForm(false);
          setPaymentForm(true);
          setShowConfirm(true);
        })
        .catch((error) => {
          setMessage('Failed to update!');
        });
    }else{
      setErrorMethod('Payment Method required!');
    }
  };

  const handleCoupon = () => {
    getCoupons();
  };

  const submitBook = async(event) => {
    event.preventDefault();
    // getPaymentIntent();
    // const { paymentMethod, error } = await stripe.confirmCardPayment(clientSecret, {
    //   payment_method: {
    //     card: elements.getElement(CardElement),
    //     billing_details: {
    //       name: 'Jenny Rosen',
    //     },
    //   }
    // });
  };
  


  const handleAddress = async() => {
    await axios
    .post(RootURL + `users/${user?.id}`, user, {
      headers: {
        Authorization: 'Bearer ' + cookies,
      },
    })
    .then((response) => {
      setMessage(response?.data?.message);
      setAddressForm(false);
    })
    .catch((error) => {
      setMessage('Failed to update!');
    });
  };

  useEffect(() => {
    const timer = setTimeout(() => {
      setMessageCoupon('');
      setErrorCoupon('');
    }, 5000);

    return () => clearTimeout(timer);
  }, [messageCoupon, errorCoupon]);

  // useEffect(() => {
  //     getBooking();
  // }, [booking]);

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
                  <li>{service?.name?.en}</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className='md-m-5 md-p-5 bg-gray'>
        <div className='container'>
          <div className='row'>
            <div className='col-md-6 col-sm-12 col-lg-6 my-5'>
            <div className='bg-white py-3 px-5 rounded d-flex justify-content-center align-items-center mb-3'>
                <div>
                  <p className='text-center'>Requested Service on</p>
                  <h3 className='text-center'>
                    {moment().format('MMMM Do YYYY, h:mm a')}
                  </h3>
                </div>
              </div>

              <div className='bg-white py-3 px-5 rounded mb-3'>
                <div className='d-flex mb-3'>
                  <div className='pr-5'>
                    <p>Your Address</p>
                  </div>

                  <div className='d-flex justify-content-between align-items-center bg-address rounded px-2 cursor-pointer' onClick={()=>setAddressForm(!addressForm)}>
                    <p className='mr-2 mb-1 fill-orenge'>New</p>
                    <BiCurrentLocation size={20} style={{ color: '#FFA500' }} />
                  </div>
                </div>
                  {addressForm ? 
                  <div className='input-group mb-3'>
                    <input
                      name='address'
                      onChange={handleInputChange}
                      type='text'
                      className='form-control'
                      placeholder='Enter your address'
                      aria-label='hint'
                      aria-describedby='basic-addon1'
                    />
                    <button onClick={handleAddress} className='btn btn-white px-4'>
                    Add
                  </button>
                  </div>:""}

                {bookingData?.address?.address ? 
                <div className='d-flex py-3'>
                  <BiMap size={20} />
                  <p className='pl-3'>{bookingData?.address?.address}</p>
                </div>:""}

              </div>

              <div className='bg-white rounded pt-5 px-3 mb-3'>
                <p>
                  <strong>Hint</strong>
                </p>
                <div className='d-flex'>
                  <BiFile size={35} />
                  <div className='input-group mb-3 px-3'>
                    <input
                      name='hint'
                      onChange={handleInputChange}
                      type='text'
                      className='form-control'
                      placeholder='Is there anything else you would like us...'
                      aria-label='hint'
                      aria-describedby='basic-addon1'
                    />
                  </div>
                </div>
              </div>
              <div>
                {messageCoupon && (
                  <div className='p-3 m-3 text-white bg-success'>
                    {messageCoupon}
                  </div>
                )}
                {errorCoupon && (
                  <div className='p-3 m-3 text-white bg-danger'>
                    {errorCoupon}
                  </div>
                )}
              </div>
              <div className='bg-white rounded p-3 mb-3'>
                <p>
                  <strong>Coupon Code</strong>
                </p>
                <div className='d-flex'>
                  <BiGift size={35} />
                  <div className='px-3 mt-1'>
                    <input
                      onChange={(e) => setCoupon(e.target.value)}
                      type='text'
                      className='form-control'
                      placeholder='COUPON'
                      aria-label='hint'
                      aria-describedby='basic-addon1'
                    />
                  </div>
                  <button onClick={handleCoupon} className='btn btn-white px-4'>
                    Apply
                  </button>
                </div>
              </div>
              {methods ?
              <div className='bg-white rounded p-3 mb-3'>
                {errorMethod && (
                  <div className='p-3 m-3 text-white bg-danger'>
                {errorMethod}
                  </div>
                )}
                <p className='px-3'>
                  <strong>Payment Method</strong>
                </p>
                <div className='d-flex'>
                  <div className='px-3 mt-1 '>
                  {/* <select className='' value={selectedMethod} onChange={(e)=>setSelectedMethod(e.target.value)}> */}
                    {methods?.map((method,index)=>(
                    <div key={index}>
                    <input
                    className=''
                      type="radio"
                      id={method?.id}
                      value={method?.id}
                      checked={selectedMethod === method?.id}
                      onChange={(e)=>setSelectedMethod(parseInt(e.target.value))}
                    />
                    <label className='ml-3' htmlFor={method?.name?.en}>{method?.name?.en}</label>
                    <br />
                  </div>
                  ))}

                  {/* </select> */}
                  {/* {selectedMethod?
                  <p><strong>Selected Method: </strong> {selectedMethod}</p>:""} */}

                  </div>
                  {/* <button onClick={handleCoupon} className='btn btn-white px-4'>
                    Apply
                  </button> */}
                </div>
              </div>:""
              }
            </div>
            <div className='col-md-6 col-sm-12 col-lg-6'>
              <div className='container'>
                <div className='d-flex justify-content-center my-5'>
                  <button
                    className='btn btn-orenge'
                    type='button'
                    onClick={submitHandler}
                  >
                    Book Now
                  </button>
                </div>

                  {showConfirm ? (
                    <div>
                      <div className='md-m-5 bg-gray d-flex justify-content-center'>
                        <div className='text-center'>
                          <div className='mb-5'>
                            <h3>Booking Summary</h3>
                          </div>
                          <div className='row d-flex justify-content-center mb-1'>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5 text-md-left'><strong>Cost of service</strong></div>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5'>{service?.price}</div>
                          </div>
                          <div className='row d-flex justify-content-center mb-1'>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5 text-md-left'><strong>Discount Price</strong> </div>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5'>
                              {service?.discount_price}
                            </div>
                          </div>
                          <div className='row d-flex justify-content-center mb-1'>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5 text-md-left'><strong>Quantity</strong> </div>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5'>x1</div>
                          </div>
                          {/* <div className='row d-flex justify-content-center mb-1'>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5 text-md-left'><strong>Maintenance</strong> </div>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5'>$2.0</div>
                          </div> */}
                          <div className='row d-flex justify-content-center mb-1'>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5 text-md-left'><strong>Tax Amount</strong> </div>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5'>{booking?.taxes[0]?.value ? booking?.taxes[0]?.value : 0}</div>
                          </div>

                          <div className='row d-flex justify-content-center mb-1'>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5 text-md-left'><strong>Sub Amount</strong> </div>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5'>{booking?.total}</div>
                          </div>
                          <div className='row d-flex justify-content-center mb-1'>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5 text-md-left'><strong>Total Amount</strong> </div>
                            <div className='col-md-2 col-lg-2 text-nowrap mr-5'>{booking?.total}</div>
                          </div>

                          {/* payment form */}
                          {paymentForm && selectedMethod===7 && booking?.total ?
                          <Elements stripe={stripePromise}>
                            <AddPayment user={user} service={service} bookingData={booking} paymentMethod={selectedMethod} />
                          </Elements>:""}
                          {paymentForm && selectedMethod===5 && booking?.total ?
                          <div className='mb-5'>
                          <PayPalScriptProvider options={{ "client-id": "ATAJlaXggQ3I8re_PoTUFPAXm3ZCFu0nX_qJNlhaeudC86XP50o9vlZvbK04lSSPaDjLAxho6VtAURCw" }}>
                            <PayPalButtons 
                            style={{ layout: "horizontal" }} 
                            createOrder={(data, actions) => {
                              return actions.order
                                  .create({
                                      purchase_units: [
                                          {
                                              amount: {
                                                currency: "USD",
                                                  value:parseInt(booking?.total),
                                              },
                                          },
                                      ],
                                  })
                                  .then((orderId) => {
                                      // Your code here after create the order
                                      return orderId;
                                  });
                          }}
                          onApprove={function (data, actions) {
                            return actions.order.capture().then(function () {
                                // Your code here after capture the order
                                // create payment
                                setPayment();
                            });
                        }}
                          />
                          </PayPalScriptProvider>
                          </div>:""
                          }

                          {/* <div className='container'>
                            <div className='d-flex justify-content-center my-5' onClick={submitBook} >
                              <button className='btn btn-orenge' type='button'>
                                Confirm & Book Service
                              </button>
                            </div>
                          </div> */}
                        </div>
                      </div>
                    </div>
                  ) : (
                    ''
                  )}

              </div>
            </div>
          </div>

        </div>
      </div>
    </>
  );
};

export default Booking;
