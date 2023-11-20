/* eslint-disable jsx-a11y/anchor-is-valid */
import Cookies from 'js-cookie';
import logo from '../../assets/anytimelogo.png';
import service1 from '../../assets/uploads/media-uploader/cleaning.png';
import service2 from '../../assets/uploads/media-uploader/bucket.png';
import { Link } from 'react-router-dom';
import RootURL from '../components/Contants';
import axios from 'axios';
import { useEffect, useState } from 'react';

const Header = () => {
  const cookies = Cookies.get('api_token');
  // eslint-disable-next-line no-unused-vars
  const [categories, setCategories] = useState('');
  console.log("categories:",categories);

  const handleLogout = async () => {
    await axios
      .get(RootURL + `logout?api_token=${cookies}`)
      .then((response) => {
        Cookies.remove('api_token');
        window.location.href = '/login';
      });
  };

  const getCategories = async () => {
    await axios
      .get(RootURL + `categories`)
      .then((response) => {
        setCategories(response?.data?.data);
      })
  };

  useEffect(() => {
    getCategories();
  }, []);


  return (
    <>
      <div className='header-style-01'>
        <div className='topbar-area'>
          <div className='container'>
            <div className='row'>
              <div className='col-lg-12'>
                <div className='topbar-inner'>
                  <div className='left-contnet'>
                    <ul className='info-items'>
                      <li>
                        <i className='far fa-clock'></i> Mon - Fri: 08.00am -
                        10.00 pm
                      </li>
                    </ul>
                  </div>
                  <div className='right-contnet'>
                    {cookies === undefined ? (
                      <ul className='info-items'>
                        <li>
                          <Link to='/login'>Login</Link>
                        </li>
                        <li>&nbsp; | &nbsp;</li>
                        <li>
                          <Link to='/user-signup'>Sign Up</Link>
                        </li>
                      </ul>
                    ) : (
                      <ul className='info-items'>
                        <li>
                          <Link onClick={handleLogout}>Logout</Link>
                        </li>
                      </ul>
                    )}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className='info-bar'>
          <div className='info-bar-bottom style-01'>
            <div className='container'>
              <div className='row'>
                <div className='col-lg-12'>
                  <div className='info-bar-inner'>
                    <div className='left-content-area'>
                      <div className='social-link'>
                        <ul>
                          <li>
                            <a href='twitter.com' target='_blank'>
                              <i className='fab fa-twitter'></i>
                            </a>
                          </li>
                          <li>
                            <a href='www.linkedin.com' target='_blank'>
                              <i className='fab fa-linkedin-in'></i>
                            </a>
                          </li>
                          <li>
                            <a href='www.facebook.com' target='_blank'>
                              <i className='fab fa-facebook-f'></i>
                            </a>
                          </li>
                          <li>
                            <a href='www.youtube.com/' target='_blank'>
                              <i className='fab fa-youtube'></i>
                            </a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <nav className='navbar navbar-area navbar-expand-lg has-topbar nav-style-02'>
          <div className='container nav-container'>
            <div className='responsive-mobile-menu'>
              <div className='logo-wrapper'>
                <Link to='/home' className='logo'>
                  <img
                    src={logo}
                    alt='site_logo'
                    style={{ height: 60, width: 60 }}
                  />
                </Link>
              </div>
              <div className='mobile-cart'>
                <a href='#'>
                  <i className='flaticon-shopping-cart-2'></i>
                </a>
              </div>
              <button
                className='navbar-toggler'
                type='button'
                data-toggle='collapse'
                data-target='#bizcoxx_main_menu'
                aria-expanded='false'
                aria-label='Toggle navigation'
              >
                <span className='navbar-toggler-icon'></span>
              </button>
            </div>
            <div className='collapse navbar-collapse' id='bizcoxx_main_menu'>
              <ul className='navbar-nav'>
                <li>
                  <a href='/home'>Home</a>
                </li>
                <li>
                  <Link to='/about'>About Us</Link>
                </li>
                <li className='menu-item-has-mega-menu'>
                  <Link to={'/services'}>Services</Link>
                  <div className='xg_mega_menu_wrapper service_mega_menu'>
                    <div className='xg-mega-menu-container'>
                      <div className='row'>
                        <div className='col-lg-3 col-md-6 d-flex justify-content-center align-items-center'>
                          <div className='xg-mega-menu-single-column-wrap'>
                            <img
                              src={service2}
                              alt='Residential Service'
                              style={{ height: 200, width: 200 }}
                            />
                          </div>
                        </div>
                        <div className='col-lg-3 col-md-6'>
                          <div className='xg-mega-menu-single-column-wrap'>
                            <h4 className='mega-menu-title'>
                              {categories[0]?.name}
                            </h4>
                            <ul>
                            {categories[0]?.e_services?.map((service,index)=>( 
                              <li key={index}>
                                <Link to={`/service/${service?.id}`}>{service?.name?.en}</Link>
                              </li>
                            ))}
                            </ul>
                          </div>
                        </div>
                        <div className='col-lg-3 col-md-6 d-flex justify-content-center align-items-center'>
                          <div className='xg-mega-menu-single-column-wrap'>
                            <img
                              src={service1}
                              alt='Commercial Service'
                              style={{ height: 200, width: 200 }}
                            />
                          </div>
                        </div>
                        <div className='col-lg-3 col-md-6'>
                          <div className='xg-mega-menu-single-column-wrap'>
                          <h4 className='mega-menu-title'>
                              {categories[1]?.name}
                            </h4>
                            <ul>
                            {categories[1]?.e_services.map((service,index)=>( 
                              <li key={index}>
                                <Link to={`/service/${service?.id}`}>{service?.name?.en}</Link>
                              </li>
                            ))}
                            </ul>
                          </div>
                        </div>
                        {/* <div className="col-lg-3 col-md-6">
                                                <div className="xg-mega-menu-single-column-wrap">
                                                    <h4 className="mega-menu-title">Others Service</h4>
                                                    <ul>
                                                        <li>
                                                            <a href="#">
                                                                Global cleaning service
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#">
                                                                Colonel or passage to ability
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div> */}
                      </div>
                    </div>
                  </div>
                </li>

                <li>
                  <Link to='/contact'>Contact Us</Link>
                </li>
                <li className='diplay-provider d-none'>
                  <div className='btn-wrapper d-flex justify-content-end'>
                    <Link
                      to='/provider-signup'
                      className='request-btn text-white'
                    >
                      Become A Cleaner
                    </Link>
                  </div>
                </li>
              </ul>
            </div>
            <div className='nav-right-content'>
              <div className='icon-part nav-style-01'>
                <ul>
                  <li className='cart'>
                    <a href='#'>
                      <i className='flaticon-shopping-cart-2'></i>
                      <span className='pcount'>0</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div className='btn-wrapper'>
                <Link to='/provider-signup' className='request-btn'>
                Become A Cleaner<i className='fas fa-long-arrow-alt-right'></i>
                </Link>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </>
  );
};

export default Header;
