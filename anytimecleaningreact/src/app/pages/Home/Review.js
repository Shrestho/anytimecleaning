import React from "react";

const Review = () => {
  return (
    <div className="container my-24 px-6 mx-auto">
      <section className="mb-32 text-gray-800 text-center">
        <h2 className="text-3xl font-bold mb-12">
          <span className="text-secondary">Review</span>
        </h2>

        <div className="grid md:grid-cols-3 gap-x-6 lg:gap-x-12">
          <div className="mb-6 lg:mb-0">
            <div className="bg-white block rounded-lg shadow-lg">
              <div className="relative overflow-hidden bg-no-repeat bg-cover">
                <img
                  src="https://mdbootstrap.com/img/new/avatars/6.jpg"
                  className="w-full rounded-t-lg"
                  alt=""
                />
                <a href="#!">
                  <div className="absolute top-0 right-0 bottom-0 left-0 w-full h-full overflow-hidden bg-fixed"></div>
                </a>
                <svg
                  className="absolute"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 1440 320"
                  style={{ left: 0, bottom: 0 }}
                >
                  <path
                    fill="#fff"
                    d="M0,288L48,272C96,256,192,224,288,197.3C384,171,480,149,576,165.3C672,181,768,235,864,250.7C960,267,1056,245,1152,250.7C1248,256,1344,288,1392,304L1440,320L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"
                  ></path>
                </svg>
              </div>
              <div className="p-6">
                <h5 className="text-lg font-bold mb-4">Maria Smith</h5>
                <p className="text-gray-500 mb-4">Frontend Developer</p>
              </div>
            </div>
          </div>

          <div className="mb-6 lg:mb-0">
            <div className="bg-white block rounded-lg shadow-lg">
              <div className="relative overflow-hidden bg-no-repeat bg-cover">
                <img
                  src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                  className="w-full rounded-t-lg"
                  alt=""
                />
                <a href="#!">
                  <div className="absolute top-0 right-0 bottom-0 left-0 w-full h-full overflow-hidden bg-fixed"></div>
                </a>
                <svg
                  className="absolute"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 1440 320"
                  style={{ left: 0, bottom: 0 }}
                >
                  <path
                    fill="#fff"
                    d="M0,96L48,128C96,160,192,224,288,240C384,256,480,224,576,213.3C672,203,768,213,864,202.7C960,192,1056,160,1152,128C1248,96,1344,64,1392,48L1440,32L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"
                  ></path>
                </svg>
              </div>
              <div className="p-6">
                <h5 className="text-lg font-bold mb-4">Darren Randolph</h5>
                <p className="text-gray-500 mb-4">Marketing expert</p>
              </div>
            </div>
          </div>

          <div className="">
            <div className="bg-white block rounded-lg shadow-lg">
              <div className="relative overflow-hidden bg-no-repeat bg-cover">
                <img
                  src="https://mdbootstrap.com/img/new/avatars/15.jpg"
                  className="w-full rounded-t-lg"
                  alt=""
                />
                <a href="#!">
                  <div className="absolute top-0 right-0 bottom-0 left-0 w-full h-full overflow-hidden bg-fixed"></div>
                </a>
                <svg
                  className="absolute"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 1440 320"
                  style={{ left: 0, bottom: 0 }}
                >
                  <path
                    fill="#fff"
                    d="M0,288L48,256C96,224,192,160,288,160C384,160,480,224,576,213.3C672,203,768,117,864,85.3C960,53,1056,75,1152,69.3C1248,64,1344,32,1392,16L1440,0L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"
                  ></path>
                </svg>
              </div>
              <div className="p-6">
                <h5 className="text-lg font-bold mb-4">Ayat Black</h5>
                <p className="text-gray-500 mb-4">Web designer</p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Review;
{
  /* <div className="container my-24 px-6 mx-auto">
      <section className="mb-32 text-gray-800 text-center">
        <h2 className="text-3xl font-bold mb-12 text-secondary">Reviews</h2>
        <div className="carousel-inner carousel-container mb-20 relative w-full overflow-hidden">
          {" "}
          <Swiper
            autoplay={{
              delay: 2500,
              disableOnInteraction: false,
            }}
            pagination={{
              clickable: true,
            }}
            navigation={true}
            onSlideChange={handleSlideChange}
          >
            {" "}
            <SwiperSlide>
              <div className="px-6 mt-20 mb-20 carousel-item active relative float-left w-full">
                <img
                  className="rounded-full shadow-lg mb-6 ml-20"
                  src="https://mdbootstrap.com/img/Photos/Avatars/img%20(10).jpg"
                  alt="avatar"
                  style={{ width: "150px" }}
                />
                <div className="flex flex-wrap justify-center">
                  <div className="grow-0 shrink-0 basis-auto w-full lg:w-8/12 px-3">
                    <h5 className="text-lg font-bold mb-3">Maria Kate</h5>
                    <p className="font-medium text-gray-700 mb-4">Lorem</p>
                    <p className="text-gray-500 mb-6">
                      <svg
                        aria-hidden="true"
                        focusable="false"
                        data-prefix="fas"
                        data-icon="quote-left"
                        className="w-6 pr-2 inline-block"
                        role="img"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 512 512"
                      >
                        <path
                          fill="currentColor"
                          d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"
                        ></path>
                      </svg>
                      In ac turpis justo. Vivamus auctor quam vitae odio feugiat
                      pulvinar. Sed semper ligula sed lorem tincidunt dignissim.
                      Nam sed cursus lectus. Proin non rutrum magna. Proin
                      gravida, justo et imperdiet tristique, turpis nisi viverra
                      est, nec posuere ex arcu sit amet erat. Sed a dictum sem.
                      Duis pretium condimentum nulla.
                    </p>
                    <ul className="flex justify-center mb-0">
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="far"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M528.1 171.5L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6zM388.6 312.3l23.7 138.4L288 385.4l-124.3 65.3 23.7-138.4-100.6-98 139-20.2 62.2-126 62.2 126 139 20.2-100.6 98z"
                          ></path>
                        </svg>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </SwiperSlide>
            <SwiperSlide>
              {" "}
              <div className="px-6 mt-20 mb-20 carousel-item relative float-left w-full">
                <img
                  className="rounded-full shadow-lg mb-6 ml-20"
                  src="https://mdbootstrap.com/img/Photos/Avatars/img%20(32).jpg"
                  alt="avatar"
                  style={{ width: "150px" }}
                />
                <div className="flex flex-wrap justify-center">
                  <div className="grow-0 shrink-0 basis-auto w-full lg:w-8/12 px-3">
                    <h5 className="text-lg font-bold mb-3">John Doe</h5>
                    <p className="font-medium text-gray-700 mb-4">Lorem</p>
                    <p className="text-gray-500 mb-6">
                      <svg
                        aria-hidden="true"
                        focusable="false"
                        data-prefix="fas"
                        data-icon="quote-left"
                        className="w-6 pr-2 inline-block"
                        role="img"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 512 512"
                      >
                        <path
                          fill="currentColor"
                          d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"
                        ></path>
                      </svg>
                      Maecenas auctor, quam eget tincidunt pretium, felis diam
                      semper turpis, sed scelerisque diam libero facilisis
                      libero. Quisque vitae semper metus. Aliquam eu dui
                      aliquam, faucibus metus quis, elementum nunc.
                    </p>
                    <ul className="flex justify-center mb-0">
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star-half-alt"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 536 512"
                        >
                          <path
                            fill="currentColor"
                            d="M508.55 171.51L362.18 150.2 296.77 17.81C290.89 5.98 279.42 0 267.95 0c-11.4 0-22.79 5.9-28.69 17.81l-65.43 132.38-146.38 21.29c-26.25 3.8-36.77 36.09-17.74 54.59l105.89 103-25.06 145.48C86.98 495.33 103.57 512 122.15 512c4.93 0 10-1.17 14.87-3.75l130.95-68.68 130.94 68.7c4.86 2.55 9.92 3.71 14.83 3.71 18.6 0 35.22-16.61 31.66-37.4l-25.03-145.49 105.91-102.98c19.04-18.5 8.52-50.8-17.73-54.6zm-121.74 123.2l-18.12 17.62 4.28 24.88 19.52 113.45-102.13-53.59-22.38-11.74.03-317.19 51.03 103.29 11.18 22.63 25.01 3.64 114.23 16.63-82.65 80.38z"
                          ></path>
                        </svg>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </SwiperSlide>
            <SwiperSlide>
              <div className="px-6 mt-20 mb-20 carousel-item relative float-left w-full">
                <img
                  className="rounded-full shadow-lg mb-6 ml-20"
                  src="https://mdbootstrap.com/img/Photos/Avatars/img%20(1).jpg"
                  alt="avatar"
                  style={{ width: "150px" }}
                />
                <div className="flex flex-wrap justify-center">
                  <div className="grow-0 shrink-0 basis-auto w-full lg:w-8/12 px-3">
                    <h5 className="text-lg font-bold mb-3">Anna Deynah</h5>
                    <p className="font-medium text-gray-700 mb-4">Lorem</p>
                    <p className="text-gray-500 mb-6">
                      <svg
                        aria-hidden="true"
                        focusable="false"
                        data-prefix="fas"
                        data-icon="quote-left"
                        className="w-6 pr-2 inline-block"
                        role="img"
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 512 512"
                      >
                        <path
                          fill="currentColor"
                          d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"
                        ></path>
                      </svg>
                      Duis sagittis, turpis in ullamcorper venenatis, ligula
                      nibh porta dui, sit amet rutrum enim massa in ante.
                      Curabitur in justo at lorem laoreet ultricies. Nunc ligula
                      felis, sagittis eget nisi vitae.
                    </p>
                    <ul className="flex justify-center mb-0">
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                      <li>
                        <svg
                          aria-hidden="true"
                          focusable="false"
                          data-prefix="fas"
                          data-icon="star"
                          className="w-4 text-yellow-500"
                          role="img"
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 576 512"
                        >
                          <path
                            fill="currentColor"
                            d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"
                          ></path>
                        </svg>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </SwiperSlide>
          </Swiper>
        </div>
      </section>
    </div> */
}
