import React from 'react';
import Rating from 'react-rating';
// import { faStar } from "@fortawesome/free-solid-svg-icons";
// import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { AiOutlineClear, AiOutlineStar } from 'react-icons/ai';
import { AiFillStar } from 'react-icons/ai';
import { useNavigate } from 'react-router-dom';
// import { BiBrushAlt } from "react-icons/bi";

const Product = ({
  name,
  en,
  id,
  description,
  price,
  discount_price,
  rate,
  enable_booking,
  media,
  featured,
}) => {
  const navigate = useNavigate();
  const navigateToServicesDetail = (id) => {
    navigate(`/service/${id}`);
  };
  return (
    <div
      className='card w-80 glass cursor-pointer'
      onClick={() => navigateToServicesDetail(id)}
    >
      <figure className=''>
        {media[0]?.url ? (
          <img height={200} width={200} src={media[0]?.url} alt='Product' />
        ) : (
          <AiOutlineClear style={{ color: '#2c9bf4' }} size={250} />
        )}
      </figure>

      <div className='card-body'>
        {' '}
        {featured ? (
          <button type='button' className='featured-btn'>
            Featured
          </button>
        ) : (
          ''
        )}
        <h2 className='card-title'>{name?.en}</h2>
        <p className='font-semibold'>
          <Rating
            initialRating={rate}
            emptySymbol={
              <AiOutlineStar icon={AiOutlineStar} style={{ color: 'orange' }} />
            }
            fullSymbol={
              <AiFillStar style={{ color: 'orange' }} icon={AiFillStar} />
            }
            readonly
          ></Rating>
        </p>
        <div className='mt-8 flex justify-between'>
          <span className='text-base text-gray-600 font-semibold'>
            Start from
          </span>
          <div className='items-end'>
            {discount_price ? (
              <>
                <del className='text-xs font-semibold text-gray-600 sm:text-sm'>
                  {' '}
                  ${price}{' '}
                </del>
                <p className='text-xs font-normal text-orange-600 sm:text-sm md:text-base'>
                  ${discount_price}
                </p>
              </>
            ) : (
              <p className='text-xs font-normal text-orange-600 sm:text-sm md:text-base'>
                ${price}{' '}
              </p>
            )}
          </div>{' '}
        </div>
      </div>
    </div>
  );
};

export default Product;
