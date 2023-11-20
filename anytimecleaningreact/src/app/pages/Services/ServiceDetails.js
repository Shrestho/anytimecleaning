import React, { useState } from "react";
import Rating from "react-rating";
import { NavLink, useParams } from "react-router-dom";
import { AiOutlineStar } from "react-icons/ai";
import { AiFillStar } from "react-icons/ai";
import useServiceDetails from "../../hooks/useServiceDetails";

const ServiceDetails = () => {
  const { id } = useParams();
  const { serviceDetails } = useServiceDetails(id);
  const [isReadMore, setIsReadMore] = useState(true);
  const toggleReadMore = () => {
    setIsReadMore(!isReadMore);
  };

  return (
    <section>
      <div className="relative mx-auto max-w-screen-xl px-4 py-8">
        <div className="grid grid-cols-1 items-start gap-8 md:grid-cols-2">
          <div className="grid grid-cols-2 gap-4 md:grid-cols-1">
            <img
              alt="Product"
              src=""
              className="aspect-square w-full rounded-xl object-cover"
            />

            <div className="grid grid-cols-2 gap-4 lg:mt-4">
              <img
                alt="Product"
                src=""
                className="aspect-square w-full rounded-xl object-cover"
              />

              <img
                alt="Product"
                src=""
                className="aspect-square w-full rounded-xl object-cover"
              />

              <img
                alt="Product"
                src=""
                className="aspect-square w-full rounded-xl object-cover"
              />

              <img
                alt="Product"
                src=""
                className="aspect-square w-full rounded-xl object-cover"
              />
            </div>
          </div>

          <div className="sticky top-0">
            <strong className="rounded-full border border-blue-600 bg-gray-100 px-3 py-0.5 text-xs font-medium tracking-wide text-blue-600">
              {serviceDetails?.featured ? "Featured" : ""}
            </strong>

            <div className="mt-8 flex justify-between">
              <div className="max-w-[35ch] space-y-2">
                <h1 className="text-xl font-bold sm:text-2xl">
                  {serviceDetails?.name?.en}
                </h1>

                <p className="text-sm">Highest Rated Product</p>

                <div className="-ml-0.5 flex">
                  <Rating
                    initialRating={serviceDetails?.rate}
                    emptySymbol={
                      <AiOutlineStar
                        icon={AiOutlineStar}
                        style={{ color: "orange" }}
                      />
                    }
                    fullSymbol={
                      <AiFillStar
                        style={{ color: "orange" }}
                        icon={AiFillStar}
                      />
                    }
                    readonly
                  ></Rating>
                </div>
              </div>

              <p className="text-lg font-bold">${serviceDetails?.price}</p>
            </div>

            <div className="mt-4">
              <div className="prose max-w-none">
                <p>
                  <span className="font-semibold"> Description: </span>
                  <span>
                    {isReadMore
                      ? serviceDetails?.description?.en
                          .slice(0, 100)
                          .replace(/(<([^>]+)>)/gi, "") + "..."
                      : serviceDetails?.description?.en.replace(
                          /(<([^>]+)>)/gi,
                          ""
                        )}
                  </span>{" "}
                  {serviceDetails?.description?.en?.length > 100 && (
                    <>
                      {" "}
                      <button
                        onClick={toggleReadMore}
                        className="mt-2 text-sm font-medium underline"
                      >
                        {isReadMore ? "Read More" : " Read Less"}
                      </button>
                    </>
                  )}
                </p>
              </div>
            </div>

            <form className="mt-8">
              <div className="mt-8 flex gap-4">
                <div>
                  <label htmlFor="quantity" className="sr-only">
                    Qty
                  </label>

                  <input
                    type="number"
                    id="quantity"
                    min="1"
                    defaultValue="1"
                    disabled
                    className="w-12 rounded border border-gray-600 focus:ring-gray-500 py-3 text-center text-base [-moz-appearance:_textfield] [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none"
                  />
                </div>
                {serviceDetails?.enable_booking ? (
                  <NavLink to={`/checkout`}>
                    {" "}
                    <button className="block rounded bg-action-color px-5 py-3 text-base font-medium text-black transition hover:scale-105">
                      Book this service
                    </button>
                  </NavLink>
                ) : (
                  <button className="w-56 rounded bg-action-color px-6 py-3 text-base font-medium text-black before:transition hover:scale-105">
                    Closed
                  </button>
                )}
              </div>
            </form>
          </div>
        </div>

        <article>
          <div className="flex items-center mb-4 space-x-4">
            <img
              className="w-10 h-10 rounded-full"
              src="/docs/images/people/profile-picture-5.jpg"
              alt=""
            />
            <div className="space-y-1 font-medium ">
              <h3>Provider</h3>
              <p className="text-black">Jese Leos </p>
            </div>
          </div>
          <div className="flex items-center mb-1">
            <svg
              aria-hidden="true"
              className="w-5 h-5 text-yellow-400"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <title>First star</title>
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>
            <svg
              aria-hidden="true"
              className="w-5 h-5 text-yellow-400"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <title>Second star</title>
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>
            <svg
              aria-hidden="true"
              className="w-5 h-5 text-yellow-400"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <title>Third star</title>
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>
            <svg
              aria-hidden="true"
              className="w-5 h-5 text-yellow-400"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <title>Fourth star</title>
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>
            <svg
              aria-hidden="true"
              className="w-5 h-5 text-yellow-400"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <title>Fifth star</title>
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>
          </div>

          <p className="mb-2 font-light text-gray-500 dark:text-gray-400">
            This is my third Invicta Pro Diver. They are just fantastic value
            for money. This one arrived yesterday and the first thing I did was
            set the time, popped on an identical strap from another Invicta and
            went in the shower with it to test the waterproofing.... No
            problems.
          </p>
          <p className="mb-3 font-light text-gray-500 dark:text-gray-400">
            It is obviously not the same build quality as those very expensive
            watches. But that is like comparing a Citroën to a Ferrari. This
            watch was well under £100! An absolute bargain.
          </p>
          <a
            href="#"
            className="block mb-5 text-sm font-medium text-blue-600 hover:underline dark:text-blue-500"
          >
            Read more
          </a>
        </article>
      </div>
    </section>
  );
};

export default ServiceDetails;
