/* eslint-disable jsx-a11y/anchor-is-valid */
import React from 'react';
import { Link } from 'react-router-dom';
import image1 from '../../../assets/uploads/media-uploader/breadcrumb1619334343.png';
import image2 from '../../../assets/uploads/media-uploader/bg-right1618906912.jpg';
import image3 from '../../../assets/uploads/media-uploader/01-min-21619273213.png';
import image4 from '../../../assets/frontend/important/choose/01.png';

const About = () => {
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
                <p>About Us</p>
                <h2 className='page-title'>About Us</h2>
                <ul className='page-list'>
                  <li>
                    <Link to='/home'>Home</Link>
                  </li>
                  <li>About Us</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <section>
      <div className='eco-friendly-area margin-top-120 margin-bottom-120'>
        <div className='container'>
          <div className='eco-friendly-area-wrapper padding-top-60 padding-bottom-60'>
            <div
              className='bg-img-02 about'
              style={{ backgroundImage: `url(${image2})` }}
            ></div>
            <div className='row'>
              <div className='col-lg-6'>
                <div className='eco-content bg-white style-01'>
                  <div className='section-title'>
                    <div className='icon'>
                      <i className='flaticon-paint-brush'></i>
                      <span className='line-three'></span>
                      <span className='line-four'></span>
                    </div>
                    <h3 className='title'>Who we are?</h3>
                    <p>
                      We&#039;re known for one thing everywhere we go excellent
                      customer experiences. With our industry-leading guarantees
                      and our unwavering.
                    </p>
                  </div>
                  <div className='content style-01'>
                    <ul>
                      <li>
                        <i className='fas fa-check'></i> Experienced Team
                      </li>
                      <li>
                        <i className='fas fa-check'></i> Keep the same cleaner
                        for every visit
                      </li>
                      <li>
                        <i className='fas fa-check'></i> One-off, weekly, or
                        fortnightly visits
                      </li>
                    </ul>
                    <div className='available-item style-01'>
                      <div className='icon'>
                        <i className='flaticon-call'></i>
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
        </div>
      </div>
      </section>

      <section>
      <div
        className='progress-bar-area bg-image padding-bottom-295 padding-top-120'
        style={{ backgroundImage: `url(${image3})` }}
      >
        <div className='container'>
          <div className='row'>
            <div className='col-lg-6'>
              <div className='section-title margin-bottom-40'>
                <div className='icon'>
                  <i className='flaticon-paint-brush'></i>
                  <span className='line-three'></span>
                  <span className='line-four'></span>
                </div>
                <h3 className='title'>
                  Our achievements over the years as a dedicated cleaning
                  service company
                </h3>
              </div>
            </div>
            <div className="col-lg-6">
              <input type="number" id="count" value="3" hidden />
              <div className="progress-item-wrapper">
                <input type="number" id="progress-val-0" value="80" hidden />
                <div className="progress-item">
                  <div className="single-progressbar">
                    <h4 className="subtitle">Service</h4>
                    <div className="progress">
                      <div
                        className="progress-bar"
                        role="progressbar"
                        style={{ width: "80%" }}
                        aria-valuenow="80"
                        aria-valuemin="0"
                        aria-valuemax="100"
                      ></div>
                    </div>
                  </div>
                </div>
                <input type="number" id="progress-val-1" value="70" hidden />
                <div className="progress-item">
                  <div className="single-progressbar">
                    <h4 className="subtitle">Behaviour</h4>
                    <div className="progress">
                      <div
                        className="progress-bar"
                        role="progressbar"
                        style={{ width: "70%" }}
                        aria-valuenow="70"
                        aria-valuemin="0"
                        aria-valuemax="100"
                      ></div>
                    </div>
                  </div>
                </div>
                <input type="number" id="progress-val-2" value="90" hidden />
                <div className="progress-item">
                  <div className="single-progressbar">
                    <h4 className="subtitle">Support</h4>
                    <div className="progress">
                      <div
                        className="progress-bar"
                        role="progressbar"
                        style={{ width: "90%" }}
                        aria-valuenow="90"
                        aria-valuemin="0"
                        aria-valuemax="100"
                      ></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
      </section>

      <section className='why-choose-use-area padding-bottom-80'>
        <div className='container'>
          <div className='why-choose-use-area-wrapper m-top'>
            <div className='row'>
              <div className='col-lg-3 col-md-6 col-sm-6'>
                <div className='choose-single-item margin-bottom-30 bg-image'>
                  <div
                    className='icon bg-image'
                    style={{ backgroundImage: `url(${image4})` }}
                  >
                    <i className='flaticon-handwash'></i>
                  </div>
                  <div className='content'>
                    <a href='#'>
                      <h4 className='title'>
                        <p>We Provide Experienced Cleaners</p>
                      </h4>
                      <span className='subtitle'>Residential Service</span>
                    </a>
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
                    style={{ backgroundImage: `url(${image4})` }}
                  >
                    <i className='flaticon-design'></i>
                  </div>
                  <div className='content'>
                    <a href='#'>
                      <h4 className='title'>
                        <p>Over 200+ Complete Task</p>
                      </h4>
                      <span className='subtitle'>Residential Service</span>
                    </a>
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
                    style={{ backgroundImage: `url(${image4})` }}
                  >
                    <i className='flaticon-admin'></i>
                  </div>
                  <div className='content'>
                    <a href='#'>
                      <h4 className='title'>
                        <p>100% Clients Satisfaction</p>
                      </h4>
                      <span className='subtitle'>Commercial Service</span>
                    </a>
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
                    style={{ backgroundImage: `url(${image4})` }}
                  >
                    <i className='flaticon-compass'></i>
                  </div>
                  <div className='content'>
                    <a href='#'>
                      <h4 className='title'>
                        <p>Global cleaning service</p>
                      </h4>
                      <span className='subtitle'>Others Service</span>
                    </a>
                    <p>
                      Maecenas tempus, tellus eget condimentum rhoncus, sem quam
                      semper libero.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section>
      <div className='counterup-area bg-liteblue'>
        <div className='container'>
          <div className='counterup-wrapper'>
            <div className='row'>
              <div className='col-lg-4 col-md-6 col-sm-6'>
                <div className='single-counterup-01'>
                  <div className='icon'>
                    <i className='flaticon-handwash'></i>
                  </div>
                  <div className='content'>
                    <div className='count-wrap'>
                      <span className='count-num'>10</span>k+
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
      </section>
    </>
  );
};

export default About;
