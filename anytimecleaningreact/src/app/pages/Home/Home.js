/* eslint-disable jsx-a11y/anchor-is-valid */
import logo from '../../../assets/company-logo.png';
import img1 from '../../../assets/uploads/media-uploader/011618747632.png';
import Service_bg from '../../../assets/uploads/media-uploader/011618730370.png';
import Icon_bg1 from '../../../assets/frontend/important/choose/01.png';
import Icon_bg2 from '../../../assets/frontend/important/choose/01.png';
import Image1 from '../../../assets/uploads/media-uploader/bg-min-service1618907068.png';
import Image2 from '../../../assets/uploads/media-uploader/bg-right1618906912.jpg';
import Testimonial from '../../../assets/uploads/media-uploader/testimonial-011618929870.png';
import Testimonial2 from '../../../assets/uploads/media-uploader/testimonial-021618929870.png';
import Testimonial3 from '../../../assets/uploads/media-uploader/testimonial-031618930158.png';
import Testimonial4 from '../../../assets/uploads/media-uploader/testimonial-bg1618991543.png';
import Image3 from '../../../assets/uploads/media-uploader/021618991591.png';
import ContactImage from '../../../assets/uploads/media-uploader/011618994172.png';
// import PostImage1 from "../../../assets/uploads/media-uploader/pexels-karolina-grabowska-4239146-min1620223752.jpg";
// import PostImage2 from "../../../assets/uploads/media-uploader/pexels-karolina-grabowska-4239032-min1620225734.jpg";
// import PostImage3 from "../../../assets/uploads/media-uploader/pexels-karolina-grabowska-4239113-min1620225894.jpg";
import Rating from 'react-rating';
import { AiOutlineClear, AiOutlineStar } from 'react-icons/ai';
import { AiFillStar } from 'react-icons/ai';
// import service1 from "../../../assets/uploads/media-uploader/service1.png";
// import service2 from '../../../assets/uploads/media-uploader/service2.png';
import service3 from '../../../assets/uploads/media-uploader/service5.png';
// import service4 from '../../../assets/uploads/media-uploader/service4.png';
import service2 from '../../../assets/uploads/media-uploader/service6.png';
import service5 from '../../../assets/uploads/media-uploader/service7.png';
import service4 from '../../../assets/uploads/media-uploader/service8.png';


// import service5 from "../../../assets/uploads/media-uploader/bg-right1618906912.jpg";
// import window_icon from "../../../assets/homeicons/windows.png";
// import garbage from "../../../assets/homeicons/garbage.png";
// import home from "../../../assets/homeicons/home.png";
// import pressure_washer from "../../../assets/homeicons/pressure-washer.png";
// import snow from "../../../assets/homeicons/snow.png";


import Banner from "../../components/Banner";
import Provider from "./Provider";
import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import RootURL from "../../components/Contants";
import { shortDesc } from "../../utils/short_desc";
import axios from 'axios';

const Home = () => {
  const [services, setServices] = useState([]);
  const [message, setMessage] = useState('');
  const [quote, setQuote] = useState({
    email: '',
    subject: '',
    phone_number: '',
    message: '',
  });

  const handleInputChange = (event) => {
    const { name, value } = event.target;
      setQuote({ ...quote, [name]: value });
  };

  const handleSubmit = async(event) =>{
    event.preventDefault();
    await axios
    .post(RootURL + `quotes`, quote,)
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

  useEffect(() => {
    fetch(RootURL + 'e_services')
      .then((response) => response.json())
      .then((data) => {
        const featuredServices = data?.data?.filter((service) => service.featured);
        setServices(featuredServices);
      });
  }, []);

  return (
    <>
      <Banner />
      {services.length >0 ? 
      <div
        className='header-bottom-area bg-blue-03 bg-image padding-bottom-80'
        style={{
          backgroundImage: `url(
           ${img1}
          )`,
        }}
      >

        <div className="container">
          <div className="header-bottom-wrapper m-top bg-white">
            <div className="row">
              <div className="col-lg-12">
                <div className="content-wrapper row">
                  <div className="left-content bg-blue col-md-3">
                    <ul className="nav nav-tabs" id="myTab" role="tablist">
                      <li className="nav-item">
                        <a
                          className='nav-link active service-item-list show'
                          id='residential-service-tab'
                          data-toggle='tab'
                          href='#residential-service'
                          role='tab'
                          aria-controls='residential-service'
                          aria-selected='true'
                        >
                          <div className='service-icon style-01'>
                            {/* <i className='flaticon-vacuum'></i> */}
                            {services[0]?.media && services[0].media.length > 0 ? (
                            <img
                            height={50}
                            width={50}
                            src={services[0].media[services[0].media.length - 1].url}
                            alt='service'
                          />):
                          <img
                          height={50}
                          width={50}
                          src={logo}
                          alt='service'
                        />
                          }
                          </div>
                          <div className="service-title">
                            <h4 className="title">{services[0]?.name?.en}</h4>
                          </div>
                        </a>
                      </li>
                      <li className='nav-item'>
                        <a
                          className='nav-link service-item-list show'
                          id='commercial-service-tab'
                          data-toggle='tab'
                          href='#commercial-service'
                          role='tab'
                          aria-controls='commercial-service'
                          aria-selected='true'
                        >
                          <div className='service-icon style-01'>
                            {/* <i className='flaticon-liquid-soap'></i> */}
                            {services[1]?.media && services[1].media.length > 0 ? (
                            <img
                            height={50}
                            width={50}
                            src={services[1].media[services[1].media.length - 1].url}
                            alt='service'
                          />):
                          <img
                          height={50}
                          width={50}
                          src={logo}
                          alt='serivice'
                        />}
                          </div>
                          <div className="service-title">
                            <h4 className="title">{services[1]?.name?.en}</h4>
                          </div>
                        </a>
                      </li>
                      <li className='nav-item'>
                        <a
                          className='nav-link service-item-list show'
                          id='vehicle-service-tab'
                          data-toggle='tab'
                          href='#vehicle-service'
                          role='tab'
                          aria-controls='vehicle-service'
                          aria-selected='true'
                        >
                          <div className='service-icon style-01'>
                            {/* <i className='flaticon-lawn-mower'></i> */}
                            {services[2]?.media && services[2].media.length > 0 ? (
                            <img
                            height={50}
                            width={50}
                            src={services[2].media[services[2].media.length - 1].url}
                            alt='Product'
                          />):
                          <img
                          height={50}
                          width={50}
                          src={logo}
                          alt='serivice'
                        />}
                          </div>
                          <div className="service-title">
                            <h4 className="title">{services[2]?.name?.en}</h4>
                          </div>
                        </a>
                      </li>
                      <li className='nav-item'>
                        <a
                          className='nav-link service-item-list show'
                          id='institutional-service-tab'
                          data-toggle='tab'
                          href='#institutional-service'
                          role='tab'
                          aria-controls='institutional-service'
                          aria-selected='true'
                        >
                          <div className='service-icon style-01'>
                            {/* <i className='flaticon-wash-1'></i> */}
                            {services[3]?.media && services[3].media.length > 0 ? (
                            <img
                            height={50}
                            width={50}
                            src={services[3].media[services[3].media.length - 1].url}
                            alt='Product'
                          />):
                          <img
                          height={50}
                          width={50}
                          src={logo}
                          alt='serivice'
                        />}
                          </div>
                          <div className="service-title">
                            <h4 className="title">{services[3]?.name?.en}</h4>
                          </div>
                        </a>
                      </li>
                      <li className='nav-item'>
                        <a
                          className='nav-link service-item-list show'
                          id='others-service-tab'
                          data-toggle='tab'
                          href='#others-service'
                          role='tab'
                          aria-controls='others-service'
                          aria-selected='true'
                        >
                          <div className='service-icon style-01'>
                            {/* <i className='flaticon-washing-hands'></i> */}
                            {services[4]?.media && services[4].media.length > 0 ? (
                            <img
                            height={50}
                            width={50}
                            src={services[4].media[services[4].media.length - 1].url}
                            alt='Product'
                          />):
                          <img
                          height={50}
                          width={50}
                          src={logo}
                          alt='serivice'
                        />}
                          </div>
                          <div className="service-title">
                            <h4 className="title">{services[4]?.name?.en}</h4>
                          </div>
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div className="right-content col-md-9">
                    <div className="tab-content" id="myTabContent">
                      <div
                        className='tab-pane fade active show'
                        id='residential-service'
                        role='tabpanel'
                        aria-labelledby='residential-service-tab'
                      >
                        <div className="description-tab-content row">
                          <div className="text-content-tab col-md-8">
                            <div className="section-title">
                              <span className="subtitle">
                              {services[0]?.name?.en}
                              </span>
                              <h3 className="title">
                                We provide best {services[0]?.name?.en} service
                              </h3>
                              <p>{shortDesc(services[0]?.description?.en,250)}</p>
                            </div>
                            <div className='content mt-4'>
                              <ul>
                              <Link to={`service/${services[0]?.id}`}>
                              <div className="btn btn-info">Call Now</div>
                              </Link>
                              </ul>
                            </div>
                          </div>
                          <div
                            className="serivce-bg col-md-4"
                            style={{
                              backgroundImage: `url(${Service_bg})`,
                            }}
                          ></div>
                        </div>
                      </div>
                      <div
                        className='tab-pane fade'
                        id='commercial-service'
                        role='tabpanel'
                        aria-labelledby='commercial-service-tab'
                      >
                        <div className="description-tab-content">
                          <div className="text-content-tab">
                            <div className="section-title">
                              <span className="subtitle">
                              {services[1]?.name?.en} Service
                              </span>
                              <h3 className="title">
                                We provide best {services[1]?.name?.en} service
                              </h3>
                              <p>{shortDesc(services[1]?.description?.en,250)}
                              </p>
                            </div>
                            <div className='content mt-4'>
                              <ul>
                              <Link to={`service/${services[1]?.id}`}>
                              <div className="btn btn-info">Call Now</div>
                              </Link>
                              </ul>
                            </div>
                          </div>
                          <div
                            className='serivce-bg'
                            style={{
                              backgroundImage: `url(${service2})`,
                            }}
                          ></div>
                        </div>
                      </div>
                      <div
                        className='tab-pane fade'
                        id='vehicle-service'
                        role='tabpanel'
                        aria-labelledby='vehicle-service-tab'
                      >
                        <div className="description-tab-content">
                          <div className="text-content-tab">
                            <div className="section-title">
                              <span className="subtitle">{services[2]?.name?.en} Service</span>
                              <h3 className="title">
                                We provide best {services[2]?.name?.en} service
                              </h3>
                              <p>{shortDesc(services[2]?.description?.en,250)}
                              </p>
                            </div>
                            <div className='content mt-4'>
                              <ul>
                              <Link to={`service/${services[2]?.id}`}>
                              <div className="btn btn-info">Call Now</div>
                              </Link>
                              </ul>
                            </div>
                          </div>
                          <div
                            className='serivce-bg'
                            style={{
                              backgroundImage: `url(${service3})`,
                            }}
                          ></div>
                        </div>
                      </div>
                      <div
                        className='tab-pane fade'
                        id='institutional-service'
                        role='tabpanel'
                        aria-labelledby='institutional-service-tab'
                      >
                        <div className="description-tab-content">
                          <div className="text-content-tab">
                            <div className="section-title">
                              <span className="subtitle">
                              {services[3]?.name?.en}
                              </span>
                              <h3 className="title">
                                We provide best {services[3]?.name?.en} service
                              </h3>
                              <p>{shortDesc(services[3]?.description?.en,250)}</p>
                            </div>
                            <div className='content mt-4'>
                              <ul>
                              <Link to={`service/${services[3]?.id}`}>
                              <div className="btn btn-info">Call Now</div>
                              </Link>
                              </ul>
                            </div>
                          </div>
                          <div
                            className='serivce-bg'
                            style={{
                              backgroundImage: `url(${service4})`,
                            }}
                          ></div>
                        </div>
                      </div>
                      <div
                        className='tab-pane fade'
                        id='others-service'
                        role='tabpanel'
                        aria-labelledby='others-service-tab'
                      >
                        <div className="description-tab-content">
                          <div className="text-content-tab">
                            <div className="section-title">
                              <span className="subtitle">{services[4]?.name?.en} Service</span>
                              <h3 className="title">
                                We provide best {services[4]?.name?.en} service
                              </h3>
                              <p>{shortDesc(services[4]?.description?.en,250)}</p>
                            </div>
                            <div className='content mt-4'>
                              <ul>
                              <Link to={`service/${services[4]?.id}`}>
                              <div className="btn btn-info">Call Now</div>
                              </Link>
                              </ul>
                            </div>
                          </div>
                          <div
                            className='serivce-bg'
                            style={{
                              backgroundImage: `url(${service5})`,
                            }}
                          ></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div> 
      </div>: ""}
      <Provider />
      <section className='why-choose-use-area padding-top-110 padding-bottom-90'>
        <div className='container'>
          <div className='row justify-content-center'>
            <div className='col-xl-7 col-sm-12 col-12'>
              <div className='section-title desktop-center margin-bottom-55'>
                <div className='icon'>
                  <span className='line-one'></span>
                  <span className='line-two'></span>
                  <i className='flaticon-paint-brush'></i>
                  <span className='line-three'></span>
                  <span className='line-four'></span>
                </div>
                <h2 className='title'>Why choose us?</h2>
                <p>
                  We&#039;re known for one thing everywhere we go excellent
                  customer experiences. With our industry-leading guarantees and
                  our unwavering.
                </p>
              </div>
            </div>
          </div>
          <div className='row'>
            <div className='col-lg-3 col-md-6 col-sm-6'>
              <div className='choose-single-item margin-bottom-30 bg-image'>
                <div
                  className='icon bg-image'
                  style={{
                    backgroundImage: `url(${Icon_bg1})`,
                  }}
                >
                  <i className='flaticon-handwash'></i>
                </div>
                <div className='content'>
                  <h4 className='title'>
                    <a href='service/cyber-security/1.html'>
                      We Provide Experienced Cleaners
                    </a>
                  </h4>
                  <p>
                    Maecenas tempus, tellus eget condimentum rhoncus, sem quam
                    semper libero.
                  </p>
                </div>
              </div>
            </div>
            <div className='col-lg-3 col-md-6 col-sm-6'>
              <div className='choose-single-item margin-bottom-30 bg-image active'>
                <div
                  className='icon bg-image'
                  style={{
                    backgroundImage: `url(${Icon_bg2})`,
                  }}
                >
                  <i className='flaticon-design'></i>
                </div>
                <div className='content'>
                  <h4 className='title'>
                    <a href='service/over-200-complete-task/8.html'>
                      Over 200+ Complete Task
                    </a>
                  </h4>
                  <p>
                    Maecenas tempus, tellus eget condimentum rhoncus, sem quam
                    semper libero.
                  </p>
                </div>
              </div>
            </div>
            <div className='col-lg-3 col-md-6 col-sm-6'>
              <div className='choose-single-item margin-bottom-30 bg-image'>
                <div
                  className='icon bg-image'
                  style={{
                    backgroundImage: `url(${Icon_bg1})`,
                  }}
                >
                  <i className='flaticon-admin'></i>
                </div>
                <div className='content'>
                  <h4 className='title'>
                    <a href='service/over-200-complete-task/9.html'>
                      100% Clients Satisfaction
                    </a>
                  </h4>
                  <p>
                    Maecenas tempus, tellus eget condimentum rhoncus, sem quam
                    semper libero.
                  </p>
                </div>
              </div>
            </div>
            <div className='col-lg-3 col-md-6 col-sm-6'>
              <div className='choose-single-item margin-bottom-30 bg-image'>
                <div
                  className='icon bg-image'
                  style={{
                    backgroundImage: `url(${Icon_bg1})`,
                  }}
                >
                  <i className='flaticon-compass'></i>
                </div>
                <div className='content'>
                  <h4 className='title'>
                    <a href='service/over-200-complete-task/10.html'>
                      Global cleaning service
                    </a>
                  </h4>
                  <p>
                    Maecenas tempus, tellus eget condimentum rhoncus, sem quam
                    semper libero.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <div className='eco-friendly-area padding-top-180 padding-bottom-227'>
        <div
          className='bg-img-01 bg-blue'
          style={{
            backgroundImage: `url(${Image1})`,
          }}
        ></div>
        <div
          className='bg-img-02 home'
          style={{
            backgroundImage: `url(${Image2})`,
          }}
        ></div>
        <div className='container'>
          <div className='row'>
            <div className='col-lg-4'>
              <div className='eco-content'>
                <div className='section-title white'>
                  <div className='icon'>
                    <i className='flaticon-paint-brush'></i>
                    <span className='line-three'></span>
                    <span className='line-four'></span>
                  </div>
                  <h3 className='title'>
                    Cleaning with Care and Eco-Friendly Products
                  </h3>
                  <p>
                    We&#039;re known for one thing everywhere we go: excellent
                    customer experiences. With our industry leading guarantees
                    and our unwavering.
                  </p>
                </div>
                <div className='content'>
                  <ul>
                    <li>
                      <i className='fas fa-check'></i> Experienced Team
                    </li>
                    <li>
                      <i className='fas fa-check'></i> Keep the same cleaner for
                      every visit
                    </li>
                    <li>
                      <i className='fas fa-check'></i> One-off, weekly or
                      fortnightly visits
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div className='col-lg-4'>
              <div className='we-available'>
                <p>
                  We&#039;re known for one thing everywhere we go excellent
                  customer experiences. With our industry leading guarantees and
                  our unwavering.
                </p>
                <div className='available-item'>
                  <div className='icon'>
                    <i className='fas fa-headset'></i>
                  </div>
                  <div className='content'>
                    <span>We are 24/7 available</span>
                    <p>+1 (236) 880-1980</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className='counterup-area'>
        <div className='container'>
          <div className='counterup-wrapper m-top bg-liteblue'>
            <div className='row'>
              <div className='col-lg-4 col-md-6 col-sm-6'>
                <div className='single-counterup-01'>
                  <div className='icon'>
                    <i className='flaticon-handwash'></i>
                  </div>
                  <div className='content'>
                    <div className='count-wrap'>
                      <span className='count-num'>5</span>k+
                    </div>
                    <h4 className='title'>Worldwide Clients</h4>
                  </div>
                </div>
              </div>
              <div className='col-lg-4 col-md-6 col-sm-6'>
                <div className='single-counterup-01'>
                  <div className='icon'>
                    <i className='flaticon-wipe'></i>
                  </div>
                  <div className='content'>
                    <div className='count-wrap'>
                      <span className='count-num'>5</span>k+
                    </div>
                    <h4 className='title'>Service Reviews</h4>
                  </div>
                </div>
              </div>
              <div className='col-lg-4 col-md-6 col-sm-6'>
                <div className='single-counterup-01'>
                  <div className='icon'>
                    <i className='flaticon-dust-pan-1'></i>
                  </div>
                  <div className='content'>
                    <div className='count-wrap'>
                      <span className='count-num'>500</span>+
                    </div>
                    <h4 className='title'>Total Km Reach So Far</h4>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <section className='testimonial-area bg-image padding-top-110 padding-bottom-120'>
        <div className='container'>
          <div className='row justify-content-center padding-bottom-45'>
            <div className='col-lg-8'>
              <div className='section-title desktop-center'>
                <div className='icon'>
                  <span className='line-one'></span>
                  <span className='line-two'></span>
                  <i className='flaticon-paint-brush'></i>
                  <span className='line-three'></span>
                  <span className='line-four'></span>
                </div>
                <h2 className='title'>What Clients Say</h2>
              </div>
            </div>
          </div>
          <div className='row'>
            <div className='col-lg-12'>
              <div className='testimonial-carousel-area'>
                <div className='testimonial-carousel'>
                  <div className='single-testimonial-item'>
                    <div
                      className='thumb bg-image'
                      style={{
                        backgroundImage: `url(${Testimonial})`,
                      }}
                    ></div>
                    <div className='content'>
                      <div className='icon'>
                        <i className='flaticon-quote-left'></i>
                      </div>
                      <p className='description'>
                        Top quality, on time and best in class cleaning service
                        in canada. We have already recommended them to many of
                        our known ones and everyone is in love with them.
                      </p>
                      <div className='author-details'>
                        <div className='author-meta'>
                          <div className='ratings'>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                          </div>
                          <h4 className='title'>- Donald Moreau</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div className='single-testimonial-item'>
                    <div
                      className='thumb bg-image'
                      style={{
                        backgroundImage: `url(${Testimonial2})`,
                      }}
                    ></div>
                    <div className='content'>
                      <div className='icon'>
                        <i className='flaticon-quote-left'></i>
                      </div>
                      <p className='description'>
                        They did a great job. Everywhere is clean and shiny
                        again. Their price was reasonable too They won't leave
                        unless you are satisfied with the job. I certainly
                        recommend their service for cleaning.
                      </p>
                      <div className='author-details'>
                        <div className='author-meta'>
                          <div className='ratings'>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                          </div>
                          <h4 className='title'>- James Curtiss</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div className='single-testimonial-item'>
                    <div
                      className='thumb bg-image'
                      style={{
                        backgroundImage: `url(${Testimonial3})`,
                      }}
                    ></div>
                    <div className='content'>
                      <div className='icon'>
                        <i className='flaticon-quote-left'></i>
                      </div>
                      <p className='description'>
                        I am delighted with the service, super immediately for
                        any emergency I will definitely request them again!!!
                      </p>
                      <div className='author-details'>
                        <div className='author-meta'>
                          <div className='ratings'>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                            <i className='fa fa-star' aria-hidden='true'></i>
                          </div>
                          <h4 className='title'>- Steven Perkins</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <div
        className='contact-area bg-image padding-top-110 padding-bottom-120'
        style={{
          backgroundImage: `url(${Testimonial4})`,
        }}
      >
        <div className='container'>
          <div className='row'>
            <div className='col-lg-6'>
              <div className='contact-img bg-image'>
                <img src={ContactImage} alt='' />
              </div>
            </div>
            <div className='col-lg-5 offset-lg-1'>
              <div className='request-page-form-wrap'>
                <div
                  className='section-title bg-image'
                  style={{
                    backgroundImage: `url(${Image3})`,
                  }}
                >
                  <h4 className='title'>Get a Quote</h4>
                  <p>Fill the form now</p>
                  {message && (
                    <div className='p-3 m-3 text-white bg-success'>{message}</div>
                  )}
                </div>
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
            </div>
          </div>
        </div>
      </div>
      <section className='blog-area padding-top-110 padding-bottom-100 bg-white'>
        <div className='container'>
          <div className='row'>
            <div className='col-lg-12'>
              <div className='blog-title-content margin-bottom-45'>
                <div className='section-title'>
                  <div className='icon'>
                    <i className='flaticon-paint-brush'></i>
                    <span className='line-three'></span>
                    <span className='line-four'></span>
                  </div>
                  <h3 className='title'>Services</h3>
                </div>
                <div className='btn-wrapper'>
                  <Link to={'/services'} className='boxed-btn'>
                    See All Services
                  </Link>
                </div>
              </div>
            </div>
          </div>
          <div className='row d-flex justify-content-center justify-content-md-between'>
            {services?.slice(0, 3).map((service, index) => (
              <div key={index} className='card w-80 glass cursor-pointer'>
                <figure className='d-flex justify-content-center'>
                  <Link to={`service/${service.id}`}>
                    {service?.media && service.media.length > 0 ? (
                    <img
                    height={250}
                    width={250}
                    src={service.media[service.media.length - 1].url}
                    alt='Product'
                  />
                    ) : (
                      <AiOutlineClear style={{ color: '#2c9bf4' }} size={250} />
                    )}
                  </Link>
                </figure>

                <div className='card-body '>
                  <div className='d-flex justify-content-center'>
                    <button type='button' className='featured-btn'>
                      Featured
                    </button>
                  </div>
                  <Link to={`service/${service.id}`}>
                    <h2 className='card-title'>{service?.name?.en}</h2>
                  </Link>

                  <p className='font-semibold text-center'>
                    <Rating
                      initialRating={service?.rate}
                      emptySymbol={
                        <AiOutlineStar
                          icon={AiOutlineStar}
                          style={{ color: 'orange' }}
                        />
                      }
                      fullSymbol={
                        <AiFillStar
                          style={{ color: 'orange' }}
                          icon={AiFillStar}
                        />
                      }
                      readonly
                    ></Rating>
                  </p>
                  <div className='mt-8'>
                    <span className='text-base text-gray-600 font-semibold d-flex justify-content-center'>
                      Start from
                    </span>
                    <div className='d-flex justify-content-center'>
                      {service?.discount_price ? (
                        <>
                          <del className='text-xs font-semibold text-gray-600 sm:text-sm'>
                            {' '}
                            ${service?.price}{' '}
                          </del>
                          <p className='pl-2 text-xs font-normal text-orange-600 sm:text-sm md:text-base'>
                            ${service?.discount_price}
                          </p>
                        </>
                      ) : (
                        <p className='text-xs font-normal text-orange-600 sm:text-sm md:text-base'>
                          ${service?.price}{' '}
                        </p>
                      )}
                    </div>{' '}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      <div className='back-to-top'>
        <span className='back-top'>
          <i className='fa fa-angle-up'></i>
        </span>
      </div>
    </>
  );
};

export default Home;
