/* import React, { useState } from "react";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import Slider from "react-slick";

const Carousel = () => {
  const images = [
    "https://media.istockphoto.com/id/1207505640/photo/hand-in-rubber-protective-glove-holding-white-spray-bottle-detergent-for-different-surfaces.jpg?b=1&s=170667a&w=0&k=20&c=CgiyJ963sdAIl5jhqKn6rbJuQBjSWxKL76NXM7rtduo=",
    "https://media.istockphoto.com/id/1433923860/photo/concept-of-cleaning-service-during-the-new-year-holidays.jpg?b=1&s=170667a&w=0&k=20&c=f3xfsyzCTlRk-vgACpkSC44kDsQaDy9mB7OZ2FX3tsQ=",
    "https://media.istockphoto.com/id/1415455001/photo/cleaner-clicks-on-the-virtual-screen-interface-on-the-icons-of-services.jpg?s=612x612&w=0&k=20&c=h2M1F54lm9Yac4HWPj7b43QOm02FaRIJP1TqYQiLzE0=",
  ];

  var settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
  };

  return (
    <div className="carousel-container">
      <Slider {...settings}>
        <div className="carousel-slide bg-no-repeat bg-cover">
          <img className="max-w-md" src={images[0]} alt=" " />
        </div>
        <div className="carousel-slide bg-no-repeat bg-cover">
          <img src={images[1]} alt=" " />
        </div>
        <div className="carousel-slide bg-no-repeat bg-cover">
          <img src={images[2]} alt=" " />
        </div>
      </Slider>
    </div>
  );
};

export default Carousel;
 */

// import React, { useState } from "react";
// import "slick-carousel/slick/slick.css";
// import "slick-carousel/slick/slick-theme.css";
// import Slider from "react-slick";
// import "./Carousel.css";
// import banner1 from "../../../src/assets/banner-1.jpg";
// import banner2 from "../../../src/assets/banner-2.jpg";
// import banner3 from "../../../src/assets/banner-3.jpg";

// const Carousel = () => {
//   var settings = {
//     dots: true,
//     infinite: true,
//     speed: 500,
//     slidesToShow: 1,
//     slidesToScroll: 1,
//   };
//
//   return (
//     <div className="carousel-container">
//       <Slider {...settings}>
//         <div className="carousel-slide bg-no-repeat bg-cover">
//           <img className="" src={banner1} alt=" " />
//         </div>
//         <div className="carousel-slide bg-no-repeat bg-cover">
//           <img src={banner2} alt=" " />
//         </div>
//         <div className="carousel-slide bg-no-repeat bg-cover">
//           <img src={banner3} alt=" " />
//         </div>
//       </Slider>
//     </div>
//   );
// };
//
// export default Carousel;
