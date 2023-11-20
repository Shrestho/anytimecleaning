/* eslint-disable jsx-a11y/anchor-is-valid */
// import React from "react";
// import { FaFacebook } from "react-icons/fa";
// import { FaTwitter } from "react-icons/fa";
// import { FaInstagram } from "react-icons/fa";
// import { FaLinkedin } from "react-icons/fa";
// import logo from "../../../src/assets/company-logo.png";
// import CustomLink from "./CustomLink";
//
// const Footer = () => {
//   return (
//     <div className="">
//       <footer className="sm:h-48 footer p-10  bg-secondary text-white grid grid-cols-2 md:grid-cols-4 gap-6">
//         <div className="items-center grid-flow-row">
//           <div className="w-40 h-24 rounded-full">
//             <img src={logo} alt={logo} />
//           </div>
//           <div className="mt-6 md:place-self-center md:justify-self-end">
//             <div className="grid grid-cols-3 md:grid-cols-2 lg:grid-cols-4 gap-4">
//               <a>
//                 <FaFacebook className="w-5 h-full mx-auto text-white hover:text-secondary" />
//               </a>
//
//               <a>
//                 <FaInstagram className="w-5 h-full mx-auto text-white hover:text-secondary" />
//               </a>
//               <a>
//                 <FaLinkedin className="w-5 h-full mx-auto text-white hover:text-secondary" />
//               </a>
//               <a>
//                 <FaTwitter className="w-5 h-full mx-auto text-white hover:text-secondary" />
//               </a>
//             </div>
//           </div>
//         </div>
//         <vr className="h-36 border border-slate-200" />
//
//         <div>
//           <span className="footer-title">Company</span>
//           <a href="about" className="hover:text-black">
//             About us
//           </a>
//           <a href="contact" className="hover:text-black">
//             Contact
//           </a>
//           <a href="faq" className="hover:text-black">
//             FAQ
//           </a>
//         </div>
//         <div>
//           <span className="footer-title">Legal</span>
//           <a className="hover:text-black">Terms of use</a>
//           <a className="hover:text-black">Privacy policy</a>
//           <a className="hover:text-black">Cookie policy</a>
//         </div>
//         <vr className="h-36 border border-slate-200" />
//
//         <CustomLink
//           to="/provider-signup"
//           className="ml-0 mt-6 md:mt-0 w-48 text-center border-2 border-primary px-6 py-2 bg-action-color hover:bg-primary hover:text-white rounded-3xl"
//         >
//           Become a Provider
//         </CustomLink>
//       </footer>
//       <footer className="footer px-10 py-4 border-t bg-black text-white border-base-300">
//         <div>
//           <p>
//             {" "}
//             &#169; {new Date().getFullYear()} &#64; All right reserved
//             <a className="text-white hover:text-cyan-600" href="">
//               {" "}
//             </a>
//           </p>
//         </div>
//         <div>
//           <p className="italic">
//             Our services are available to all members of the public regardless
//             of race, gender or sexual orientation.
//           </p>
//         </div>
//       </footer>
//     </div>
//   );
// };
//
// export default Footer;

import FooterImage from '../../assets/uploads/media-uploader/footer-bg-min1619971609.png';
import FooterLogo from '../../assets/company-logo.png';
// import PostImage4 from "../../assets/uploads/media-uploader/thumb-pexels-karolina-grabowska-4239146-min1620223752.jpg";
// import PostImage5 from "../../assets/uploads/media-uploader/thumb-pexels-karolina-grabowska-4239032-min1620225734.jpg";
import { Link } from 'react-router-dom';

const Footer = () => {
  return (
    <footer
      className='footer-area bg-blue-02 bg-image'
      style={{
        backgroundImage: `url(${FooterImage})`,
      }}
    >
      <div className='footer-top padding-bottom-50 padding-top-80'>
        <div className='container'>
          <div className='row'>
            <div className='col-lg-3 col-md-6'>
              <div className='footer-widget widget'>
                <div className='footer-widget widget'>
                  <div className='about_us_widget style-01'>
                    <div className='d-flex justify-content-start'>
                    <img
                      src={FooterLogo}
                      className='footer-logo'
                      alt='site_white_logo'
                    />
                    </div>
                    <p>Quality Cleaning Service In BC, Canada</p>
                  </div>
                </div>
              </div>
            </div>
            <div className='col-lg-3 col-md-6'>
              <div className='footer-widget widget'>
                <h4 className='widget-title style-01'>Services</h4>
                <ul className='recent_post_item'>
                  <li className='single-recent-post-item'>
                    {/*<div className="thumb">*/}
                    {/*  <img src={PostImage4} alt="post4" />*/}
                    {/*</div>*/}
                    <div className='content'>
                      <h4 className='title'>
                        {/*<a href="blog/healthy-life-is-clean-life/5.html">*/}
                        {/*  A healthy life is a clean life for everyone*/}
                        {/*</a>*/}
                        <a>Residential Cleaning</a>
                      </h4>
                    </div>
                  </li>
                  <li className='single-recent-post-item'>
                    {/*<div className="thumb">*/}
                    {/*  <img src={PostImage5} alt="post5" />*/}
                    {/*</div>*/}
                    <div className='content'>
                      <h4 className='title'>
                        {/*<a href="blog/cleaning-are-best-business-for-future/4.html">*/}
                        {/*  Cleaning are best business for future*/}
                        {/*</a>*/}
                        <a>Commercial Cleaning</a>
                      </h4>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
            <div className='col-lg-3 col-md-6'>
              <div className='footer-widget widget'>
                <div className='footer-widget widget widget_nav_menu'>
                  <h4 className='widget-title'>Useful Links</h4>
                  <ul>
                    <li>
                      <a href='#'>How It Works</a>
                    </li>
                    <li>
                      <Link to={'/faq'}>Faq</Link>
                    </li>
                    <li>
                      <Link to={'#'}>About Us</Link>
                    </li>
                    <li>
                      <Link to={'/contact'}>Contact Us</Link>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div className='col-lg-3 col-md-6'>
              <div className='footer-widget widget'>
                <h4 className='widget-title'>Contact us</h4>
                <ul className='contact_info_list'>
                  <li className='single-info-item'>
                    <div className='icon'>
                      <i className='fa fa-home'></i>
                    </div>
                    <div className='details'>
                      1771 Robson Street -1579 Vancouver, BC V6G 3B7 Canada
                    </div>
                  </li>
                  <li className='single-info-item'>
                    <div className='icon'>
                      <i className='fa fa-phone'></i>
                    </div>
                    <div className='details'>+1 (236) 880-1980</div>
                  </li>
                  <li className='single-info-item'>
                    <div className='icon'>
                      <i className='fas fa-envelope-open'></i>
                    </div>
                    <div className='details'>
                      <a href='mailto:info@anytimecleaning.com'>
                        info@anytimecleaning.com
                      </a>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className='copyright-area'>
        <div className='container'>
          <div className='row'>
            <div className='col-lg-12'>
              <div className='copyright-area-inner'>
                © Copyright 2023 . All Right Reserved By Anytime Cleaning
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};
export default Footer;
