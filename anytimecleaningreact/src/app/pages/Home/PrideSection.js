import React from 'react';
import logo from '../../../assets/company-logo.png';
const PrideSection = () => {
  return (
    <div className='container mt-16 px-6 mx-auto lg:flex'>
      <div
        className='h-60 mb-10 md:mb-0 bg-cover lg:h-auto lg:w-48 flex-none text-center overflow-hidden'
        title='Woman holding a mug'
      >
        <img src={logo} alt='logo' />
      </div>
      <div className='bg-white rounded-b lg:rounded-b-none lg:rounded-r p-4 flex flex-col justify-between leading-normal'>
        <div className='ml-8 mb-8'>
          <div className='text-gray-900 font-bold text-lg md:text-xl lg:text-3xl mb-10'>
            <h1 className='text-center'>
              Our work is exterior cleaning, but our mission is creating
              extraordinary experiences.
            </h1>
            <p className='text-center mt-8 text-secondary font-semibold text-base md:text-lg lg:text-2xl'>
              When you spot the tartan, you know your home will be held to the
              highest standard.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default PrideSection;
