import React from 'react';
import Pic from '../../../assets/our-service-section-pic.jpg';
import window from '../../../assets/window-cleaning.jpeg';
import gutter from '../../../assets/GUTTER-CLEANING.png';
import house from '../../../assets/house-washing.png';
import pressure from '../../../assets/pressure-washing.png';

const OurServicesSection = () => {
  return (
    <div className='container my-24 px-6 mx-auto'>
      <section className='mb-32 text-gray-800'>
        <div className='block rounded-lg shadow-lg bg-white'>
          <div className='grid grid-cols-2'>
            <div className='grow-0 shrink-0 basis-auto w-full lg:w-6/12 xl:w-11/12'>
              <div className='px-6 py-12 md:px-12'>
                <h2 className='text-2xl font-bold mb-4 italic'>our services</h2>
                <p className='uppercase text-secondary text-3xl font-bold mb-6 flex items-center'>
                  What we clean
                </p>
                <div className='flex flex-wrap mb-12 md:mb-0'>
                  <div className='grow-0 shrink-0 basis-auto w-2/12'>
                    <img
                      src={window}
                      className='w-full shadow-lg rounded-lg mb-6'
                      alt='Window Cleaning'
                    />
                  </div>

                  <div className='grow-0 shrink-0 basis-auto w-10/12 pl-4 md:pl-6'>
                    <p className='uppercase font-semibold mb-3'>
                      Window Cleaning
                    </p>
                    <p>
                      Squeaky clean. Never streaky. That’s how we do windows!
                    </p>
                  </div>
                </div>

                <div className='flex flex-wrap mb-12 md:mb-0'>
                  <div className='grow-0 shrink-0 basis-auto w-2/12'>
                    <img
                      src={gutter}
                      className='w-full shadow-lg rounded-lg mb-6'
                      alt='Gutter Cleaning'
                    />
                  </div>

                  <div className='grow-0 shrink-0 basis-auto w-10/12 pl-4 md:pl-6'>
                    <p className='uppercase font-semibold mb-3'>
                      Gutter Cleaning
                    </p>
                    <p>Gutters so clean, you’ll exclaim “Great Scot!”</p>
                  </div>
                </div>

                <div className='flex flex-wrap'>
                  <div className='grow-0 shrink-0 basis-auto w-2/12'>
                    <img
                      src={house}
                      className='w-full shadow-lg rounded-lg mb-6'
                      alt='House Washing'
                    />
                  </div>

                  <div className='grow-0 shrink-0 basis-auto w-10/12 pl-4 md:pl-6'>
                    <p className='uppercase font-semibold mb-3'>
                      House Washing
                    </p>
                    <p>
                      Our soft-wash system blasts away dirt, not your siding.
                    </p>
                  </div>
                </div>
                <div className='flex flex-wrap'>
                  <div className='uppercase grow-0 shrink-0 basis-auto w-2/12'>
                    <img
                      src={pressure}
                      className='w-full shadow-lg rounded-lg mb-6'
                      alt='Pressure Washing'
                    />
                  </div>

                  <div className='grow-0 shrink-0 basis-auto w-10/12 pl-4 md:pl-6'>
                    <p className='uppercase font-semibold mb-3'>
                      Pressure Washing
                    </p>
                    <p>We’ll give caked on dirt and grime the heave-ho!</p>
                  </div>
                </div>
              </div>
            </div>
            <div className='hidden lg:flex grow-0 shrink-0 basis-auto lg:w-6/12 xl:w-full'>
              <img
                src={Pic}
                alt='House Cleaning'
                className='w-full rounded-t-lg lg:rounded-tl-none lg:rounded-br-lg'
              />
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};

export default OurServicesSection;
