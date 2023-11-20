/* eslint-disable jsx-a11y/iframe-has-title */
/* eslint-disable jsx-a11y/anchor-is-valid */
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import BreadcrumbImage from '../../../assets/uploads/media-uploader/breadcrumb1619334343.png';
import axios from 'axios';
import RootURL from "../../components/Contants";

const Contact = () => {
  const [message, setMessage] = useState('');
  const [contact, setContact] = useState({
    name: '',
    email: '',
    subject: '',
    phone_number: '',
    message: '',
  });

  const handleInputChange = (event) => {
    const { name, value } = event.target;
      setContact({ ...contact, [name]: value });
  };

  const handleSubmit = async(event) =>{
    event.preventDefault();
    await axios
    .post(RootURL + `contacts`, contact,)
    .then((response) => {
      setMessage(response?.data?.message);
    })
    .catch((error) => {
      setMessage('Failed to add!');
    });
  }

  useEffect(() => {
    const timer = setTimeout(() => {
      setMessage('');
    }, 5000);

    return () => clearTimeout(timer);
  }, [message]);

  return (
    <>
      <div
        className='breadcrumb-area'
        style={{ backgroundImage: `url(${BreadcrumbImage})` }}
      >
        <div className='container'>
          <div className='row'>
            <div className='col-lg-12'>
              <div className='breadcrumb-inner'>
                <p>Contact Us</p>
                <h2 className='page-title'>Contact Us</h2>
                <ul className='page-list'>
                  <li>
                    <Link to='/home'>Home</Link>
                  </li>
                  <li>Contact Us</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className='contact-inner-area padding-bottom-120 padding-top-120'>
        <div className='container'>
          <div className='row'>
            <div className='col-lg-5'>
              <div className='content-area'>
                <div className='section-title padding-bottom-25'>
                  <h4 className='title'>
                    We offer 24/7 emergency service to all of our customers
                  </h4>
                </div>
                <div className='single-contact-item'>
                  <div className='icon'>
                    <i className='flaticon-phone'></i>
                  </div>
                  <div className='content'>
                    <span className='title'>Phone</span>
                    <p className='details'>+1 (236) 880-1980</p>
                  </div>
                </div>
                <div className='single-contact-item'>
                  <div className='icon'>
                    <i className='flaticon-mail-2'></i>
                  </div>
                  <div className='content'>
                    <span className='title'>Mail US</span>
                    <p className='details'>
                      <a
                        href='mailto:info@anytimecleaning.com'
                        className='__cf_email__'
                        data-cfemail='e78e898188a7948f86908889c99f8082898e889294c984888a'
                      >
                        info@anytimecleaning.com
                      </a>
                      <br />
                    </p>
                  </div>
                </div>
                <div className='single-contact-item'>
                  <div className='icon'>
                    <i className='flaticon-pin'></i>
                  </div>
                  <div className='content'>
                    <span className='title'>Address </span>
                    <p className='details'>
                      1771 Robson Street -1579 Vancouver, BC V6G 3B7
                      <br />
                      Canada
                      <br />
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div className='col-lg-6 offset-lg-1'>
              <div className='contact-form style-01'>
              {message && (
                    <div className='p-3 m-3 text-white bg-success'>{message}</div>
                  )}
                <form
                  action='#'
                  method='POST'
                  className='contact-page-form style-01'
                  id='contact_us_form'
                >
                  <input
                    type='hidden'
                    name='captcha_token'
                    id='gcaptcha_token'
                  />
                  <input
                    type='hidden'
                    name='_token'
                    value='xjc8pExQD589SXnhjNPnNrK4gqgumStBzIbSywL7'
                  />
                  <div className='error-message margin-bottom-20'></div>
                  <div className='form-group'>
                    <input
                      type='text'
                      id='name'
                      name='name'
                      className='form-control'
                      placeholder='Name'
                      required='required'
                      onChange={handleInputChange}
                    />
                  </div>
                  <div className='form-group'>
                    <input
                      type='text'
                      id='subject'
                      name='subject'
                      className='form-control'
                      placeholder='Subject'
                      required='required'
                      onChange={handleInputChange}
                    />
                  </div>
                  <div className='form-group'>
                    <input
                      type='email'
                      id='email'
                      name='email'
                      className='form-control'
                      placeholder='Email'
                      required='required'
                      onChange={handleInputChange}
                    />
                  </div>
                  <div className='form-group'>
                    <input
                      type='tel'
                      id='phone'
                      name='phone_number'
                      className='form-control'
                      placeholder='Phone'
                      onChange={handleInputChange}
                    />
                  </div>
                  <div className='form-group textarea'>
                    <textarea
                      name='message'
                      id='message'
                      cols='30'
                      rows='10'
                      className='form-control'
                      placeholder='Your Message'
                      required='required'
                      onChange={handleInputChange}
                    ></textarea>
                  </div>
                  <div className='btn-wrapper' onClick={handleSubmit}>
                    <a
                      href='#'
                      className='boxed-btn btn-block'
                      id='contact_us_submit_btn'
                    >
                      <span>Submit Message</span>
                    </a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className='map-area'>
        <div className='container-fluid p-0'>
          <div className='row'>
            <div className='col-md-12 col-lg-12'>
              <div className='contact_map'>
                <div className='elementor-custom-embed'>
                  <iframe
                    frameBorder='0'
                    scrolling='no'
                    marginHeight='0'
                    marginWidth='0'
                    src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2602.2142105147095!2d-123.13744442420723!3d49.29128517014592!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x548671881412d8f5%3A0xe0df6a5e3561990d!2sRobson%20St%2C%20Vancouver%2C%20BC%20V6G%201C9%2C%20Canada!5e0!3m2!1sen!2sbd!4v1680864573460!5m2!1sen!2sbd&amp;t=m&amp;z=10&amp;output=embed&amp;iwloc=near'
                    aria-label='2626 Angie Drive Santa Ana, CA 92701'
                  ></iframe>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Contact;
