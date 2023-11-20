import image1 from '../../../assets/uploads/media-uploader/breadcrumb1619334343.png';
import { Link, useParams } from 'react-router-dom';
import React, { useState } from 'react';
import Service_bg from '../../../assets/uploads/media-uploader/011618730370.png';
import Image3 from '../../../assets/uploads/media-uploader/021618991591.png';
import {
  AiFillStar,
  AiOutlineCheckCircle,
  AiOutlineLike,
  AiOutlineMobile,
} from 'react-icons/ai';
import Provider from '../Home/Provider';
import useServiceDetails from '../../hooks/useServiceDetails';
import { shortDesc } from '../../utils/short_desc';
import { useEffect } from 'react';
import ReactModal from 'react-modal';
import axios from 'axios';
import RootURL from "../../components/Contants";


const Service = () => {
  const { id } = useParams();
  const [serviceDetail,setServiceDetail] = useState();
  const [isReadMore, setIsReadMore] = useState(true);
  const [modalIsOpen, setModalIsOpen] = useState(false);
  const [message, setMessage] = useState('');
  const [estimate, setEstimate] = useState({
    email: '',
    subject: '',
    phone_number: '',
    message: '',
    service: serviceDetail?.name?.en
  });

  const handleInputChange = (event) => {
    const { name, value } = event.target;
      setEstimate({ ...estimate, [name]: value });
  };

  const handleSubmit = async(event) =>{
    event.preventDefault();
    await axios
    .post(RootURL + `estimates`, estimate,)
    .then((response) => {
      setMessage(response?.data?.message);
      setModalIsOpen(false);
    })
    .catch((error) => {
      setMessage('Failed to add!');
    });
  }

  const getService = async() =>{
    await axios
    .get(RootURL + `e_services/${id}`)
    .then((response) => {
      setServiceDetail(response?.data?.data);
      setMessage(response?.data?.message);
      setModalIsOpen(false);
    })
    .catch((error) => {
      setMessage('Failed to add!');
    });
  }

  useEffect(() => {
    getService();
  }, [id]);

  useEffect(() => {
    const timer = setTimeout(() => {
      setMessage('');
    }, 5000);

    return () => clearTimeout(timer);
  }, [message]);

  useEffect(() => {
    setEstimate({service: serviceDetail?.name?.en})
  }, [serviceDetail]);
  // Function to open the modal
  const openModal = () => {
    setModalIsOpen(true);
  }

  // Function to close the modal
  const closeModal = () => {
    setModalIsOpen(false);
  }

  // eslint-disable-next-line no-unused-vars
  const toggleReadMore = () => {
    setIsReadMore(!isReadMore);
  };

  useEffect(() => {
    // eslint-disable-next-line no-restricted-globals
    localStorage.setItem('prevPath', location.pathname);
    // eslint-disable-next-line react-hooks/exhaustive-deps, no-restricted-globals
  }, [location.pathname]);

  const handleUrl = () => {
    localStorage.setItem('prevPath', `service-booking/${serviceDetail?.id}`);
  };

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
                    <Link to={'/home'}>Home</Link>
                  </li>
                  <li>
                    <Link to={'/services'}>Services</Link>
                  </li>
                  <li>{serviceDetail?.name?.en}</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className='container top-margin'>
          
          <section className='booking'>
          <div className='row'>
            <div className='col-md-6 col-sm-12 col-lg-6 bg-section px-5 pt-3'>
              {serviceDetail?.media?.length>0 ?
              <img src={serviceDetail?.media[0]?.url} alt='service' />:
              <img src={Service_bg} alt='service' />
              }

            </div>
            <div className='col-md-6 col-sm-12 col-lg-6 b-shadow pt-5 mt-md-0 mt-5'>
              <h1>
                <strong>{serviceDetail?.name?.en}</strong>
              </h1>
              <h3>We raise the bar so you don’t have to</h3>
              <p
                dangerouslySetInnerHTML={{
                  __html: shortDesc(serviceDetail?.description?.en, 200),
                }}
              />
              <div className='py-3'>
                <Link to={`/service-booking/${serviceDetail?.id}`}>
                  <button onClick={handleUrl} className='btn btn-info'>
                    Book Now
                  </button>
                </Link>
              </div>
            </div>
          </div>
          </section>

        </div>
           
          <Provider serviceProvider={serviceDetail?.e_provider} />
          
          <section className='container'>
            <div className='pb-5'>
              <h3 className='mb-3'>Description:</h3>
              <p
                dangerouslySetInnerHTML={{
                  __html: serviceDetail?.description?.en,
                }}
              />
            </div>
          </section>
          
          <section className='container'>
            <div className='row'>
              <div className='col-md-6 col-sm-12 col-lg-5'>
                <div className='d-flex'>
                  <div className=''>
                    <strong>our process </strong>{' '}
                  </div>
                  <div className='px-3'>
                    <AiFillStar style={{ color: '#ffa00e' }} />
                  </div>
                  <div>
                    <hr />
                  </div>
                </div>
                <div>
                  <h2 className='title font-weight-bold'>How we clean windows</h2>
                  <h3 className=''>
                    Our four-step process means you’ll always get the best
                    results.
                  </h3>
                </div>
              </div>
              <div className='col-md-6 col-sm-12 col-lg-6'>
                <div className='d-flex'>
                  <div className='numbering'>
                    <b>1</b>
                  </div>
                  <div>
                    One of our kilted cleaning experts thoroughly inspects your
                    windows and notes any damage, leaks, broken glass, or other
                    problems.
                  </div>
                </div>
                <div className='d-flex py-4'>
                  <div className='numbering'>
                    <b>2</b>
                  </div>
                  <div>
                    We clean your windows using non-abrasive materials, including
                    mops, scrubs, and squeegees, for a streak-free shine.
                  </div>
                </div>
                <div className='d-flex'>
                  <div className='numbering'>
                    <b>3</b>
                  </div>
                  <div>We detail clean the window sill, corners, and edges.</div>
                </div>
                <div className='d-flex py-4'>
                  <div className='numbering'>
                    <b>4</b>
                  </div>
                  <div>
                    We thoroughly clean-up so we leave your home even better than
                    we found it.
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section className='container'>
          <div className='row py-5'>
            <div className='col-md-6 col-sm-12 col-lg-6'>
              {serviceDetail?.media.length>1 ?
              <img src={serviceDetail?.media[serviceDetail?.media.length-1]} alt='service' />:
              <img src={Service_bg} alt='service' />
              }

            </div>
            <div className='col-md-6 col-sm-12 col-lg-6'>
              <h1>
                <strong>Why invest in professional window cleaning?</strong>
              </h1>
              <p>
                Part art, part science - getting a streak-free shine on your
                home’s windows takes know-how, the right products and tools, and
                maybe even a ladder. One wrong step and you could damage the
                glass or fall on your… backside. Trusting this important job to
                a novice cleaner might not be a smart move, either. All it takes
                is one ladder slip or misuse of tools, and you’ve got a
                liability on your hands. The choice, then, is clear (just like
                your windows will be) - you need the Men In Kilts team.
              </p>
              <br />
              <p>
                Cleaning the interior of your windows and screens can extend the
                life of your windows, protect indoor air quality, and increase
                your home’s energy efficiency. Ditch the DIY, sit the rookies on
                the bench, and discover why a kilted clean means getting
                high-quality, long-lasting results.{' '}
              </p>
              <p className='txt-hlt v2 mt-4'>
                Our team is ready to get to work. Reach out to us at
                <strong>
                  <a href='tel:(888) 292-1176'> (888) 292-1176 </a>
                </strong>
                today!{' '}
              </p>
            </div>
          </div>
          </section>

          <section>
          <div className='cstm-bg rounded py-5'>
            <div className='container'>
              <div className='text-center'>
                <AiFillStar style={{ color: '#ffa00e' }} />
                <span className='text-white'>a clear choice</span>
                <AiFillStar style={{ color: '#ffa00e' }} />
              </div>
              <h2 className='text-center text-white pb-3 fw-600'>
                The benefits of a squeaky clean window
              </h2>
            <div className='row bg-white rounded mx-md-5'>
              <div className='col-md-4'>
                <div className='card'>
                  <div className='card-body'>
                    <div className='d-flex justify-content-center'>
                      <AiOutlineCheckCircle
                        size={40}
                        style={{ color: '#007bff' }}
                      />
                    </div>
                    <div>
                      <p className='card-text text-center pt-3'>
                        Long-term protection against cracking, etching, and
                        scratches
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div className='col-md-4'>
                <div className='card'>
                  <div className='card-body'>
                    <div className='d-flex justify-content-center'>
                      <AiOutlineCheckCircle
                        size={40}
                        style={{ color: '#007bff' }}
                      />
                    </div>
                    <div>
                      <p className='card-text text-center pt-3'>
                        Lets more natural light into your home
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div className='col-md-4'>
                <div className='card'>
                  <div className='card-body'>
                    <div className='d-flex justify-content-center'>
                      <AiOutlineCheckCircle
                        size={40}
                        style={{ color: '#007bff' }}
                      />
                    </div>
                    <div>
                      <p className='card-text text-center pt-3'>
                        Better-looking windows and increased curb appeal
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
          </div>
          </section>

          <section className='container'>
            <div className='d-flex justify-content-center py-5'>
              <div className=''>
                <div className='py-5'>
                  <h1>
                    <strong>How it works when you work with us:</strong>
                  </h1>
                </div>
                <div className='d-flex'>
                  <div className='pr-5'>
                    <AiOutlineMobile size={100} />
                  </div>
                  <div>
                    <h3>Schedule your free estimate.</h3>
                    <p>
                      We’ll visit your home, assess the situation and come up with
                      the best solution for your situation.
                    </p>
                  </div>
                </div>
                <div className='d-flex py-4'>
                  <div className='pr-5'>
                    <AiOutlineCheckCircle size={100} />
                  </div>
                  <div>
                    <h3>Book your service.</h3>
                    <p>
                      We’ll show up on time and be ready to work. Plus, we’ll send
                      you updates from pre-appointment to completion so you’re
                      always in the loop.
                    </p>
                  </div>
                </div>
                <div className='d-flex'>
                  <div className='pr-5'>
                    <AiOutlineLike size={100} />
                  </div>
                  <div>
                    <h3>Check our work.</h3>
                    <p>
                      Your satisfaction is our priority. That’s why we conduct a
                      post-service walk-through so you can make sure everything
                      has been handled to the highest standard
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div className='px-100 my-5'>
              <button className='btn btn-info' onClick={openModal}>Schedule estimate</button>
              <ReactModal
                isOpen={modalIsOpen}
                onRequestClose={closeModal}
                contentLabel="Example Modal"
                className="d-flex justify-content-center"
                style={{
                  overlay: {
                    zIndex: 9999 
                  },
                  content: {
                    zIndex: 10000
                  }
                }}
              >

              <div className='request-page-form-wrap'>
                  {message && (
                    <div className='p-3 m-3 text-white bg-success'>{message}</div>
                  )}
                <form
                  // action=''
                  // method='POST'
                  className='request-page-form'
                  encType='multipart/form-data'
                  id='quote_form'
                >
                  <input
                    type='hidden'
                    name='_token'
                    value='xjc8pExQD589SXnhjNPnNrK4gqgumStBzIbSywL7'
                  />
                  <div className='form-group'>
                    <input
                      type='email'
                      id='email'
                      name='email'
                      className='form-control'
                      placeholder='Email'
                      onChange={handleInputChange}
                    />
                  </div>
                  <div className='form-group'>
                    <input
                      type='text'
                      id='phone_number'
                      name='phone_number'
                      className='form-control'
                      placeholder='Phone number'
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
                      onChange={handleInputChange}
                    />
                  </div>
                  <div className='form-group'>
                    <input
                      type='text'
                      id='subject'
                      name='subject'
                      value={serviceDetail?.name?.en}
                      className='form-control'
                      placeholder='Subject'
                      disabled
                    />
                  </div>
                  <div className='form-group textarea'>
                    <textarea
                      name='message'
                      id='message'
                      cols='30'
                      rows='10'
                      className='form-control'
                      placeholder='Message'
                      onChange={handleInputChange}
                    ></textarea>
                  </div>
                  <input
                    type='hidden'
                    name='captcha_token'
                    id='gcaptcha_token'
                  />
                    <button className='submit-btn mb-2' onClick={closeModal}>Close</button>
                  <div className='form-group' onClick={handleSubmit}>
                    <input
                      type='submit'
                      id='quote_submit_btn'
                      value='Submit Request'
                      className='submit-btn'
                    />
                  </div>
                </form>
              </div>
      </ReactModal>
            </div>
          </section>

    </>
  );
};

export default Service;
