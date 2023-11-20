import React from "react";

const CheckoutForm = () => {
  return (
<section className="px-8 md:px-20 mx-auto my-10 top-margin">
  <h1 className="visually-hidden ml-5">Checkout</h1>
  <div className="mx-auto container-fluid">
    <div className="row bg-light">
      <div className="col-md-6 py-5">
        <div className="mx-auto max-w-lg space-y-8 px-4 lg:px-8">
          <div className="d-flex align-items-center gap-4">
            <h2 className="font-medium text-gray-900">Lorem</h2>
          </div>

          <div>
            <p className="text-2xl font-medium tracking-tight text-gray-900">
              $99.99
            </p>

            <p className="mt-1 text-sm text-gray-600">For the purchase of</p>
          </div>

          <div>
            <div className="list-group">
              <div className="list-group-item d-flex gap-4 py-4">
                <img
                  src=""
                  alt=""
                  className="rounded-circle"
                  width="64"
                  height="64"
                />
                <div>
                  <h3 className="mb-0">Basic Service</h3>
                  <div className="text-muted">
                    <dl className="mb-0">
                      <dt className="d-inline">Quantity:</dt>
                      <dd className="d-inline ms-1">1</dd>
                    </dl>
                  </div>
                </div>
              </div>

              <div className="list-group-item d-flex gap-4 py-4">
                <img
                  src=""
                  alt=""
                  className="rounded-circle"
                  width="64"
                  height="64"
                />
                <div>
                  <h3 className="mb-0">Massage Service</h3>
                  <div className="text-muted">
                    <dl className="mb-0">
                      <dt className="d-inline">Quantity:</dt>
                      <dd className="d-inline ms-1">1</dd>
                    </dl>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>


        <div className="col-md-6 bg-white py-12 md:py-24 my-5 rounded py-5">
          <div className="mx-auto container px-4 lg:px-8">
            <form className="row g-4">
              <div className="col-md-6">
                <label
                  htmlFor="FirstName"
                  className="form-label text-xs font-medium text-gray-700"
                >
                  First Name
                </label>

                <input
                  type="text"
                  id="FirstName"
                  className="form-control"
                />
              </div>

              <div className="col-md-6">
                <label
                  htmlFor="LastName"
                  className="form-label text-xs font-medium text-gray-700"
                >
                  Last Name
                </label>

                <input
                  type="text"
                  id="LastName"
                  className="form-control"
                />
              </div>

              <div className="col-12">
                <label
                  htmlFor="Email"
                  className="form-label text-xs font-medium text-gray-700"
                >
                  Email
                </label>

                <input
                  type="email"
                  id="Email"
                  className="form-control"
                />
              </div>

              <div className="col-12">
                <label
                  htmlFor="Phone"
                  className="form-label text-xs font-medium text-gray-700"
                >
                  Phone
                </label>

                <input
                  type="tel"
                  id="Phone"
                  className="form-control"
                />
              </div>

              <fieldset className="col-12">
                <legend className="form-label text-sm font-medium text-gray-700">
                  Card Details
                </legend>

                <div className="mb-3">
                  <label htmlFor="CardNumber" className="form-label">
                    Card Number
                  </label>

                  <input
                    type="text"
                    id="CardNumber"
                    placeholder="Card Number"
                    className="form-control"
                  />
                </div>

                <div className="row g-3">
                  <div className="col-md-6">
                    <label htmlFor="CardExpiry" className="form-label">
                      Card Expiry
                    </label>

                    <input
                      type="text"
                      id="CardExpiry"
                      placeholder="Expiry Date"
                      className="form-control"
                    />
                  </div>

                  <div className="col-md-6">
                    <label htmlFor="CardCVC" className="form-label">
                      Card CVC
                    </label>

                    <input
                      type="text"
                      id="CardCVC"
                      placeholder="CVC"
                      className="form-control"
                    />
                  </div>
                </div>
              </fieldset>

              <fieldset className="col-12">
                <legend className="form-label text-sm font-medium text-gray-700">
                  Billing Address
                </legend>

                <div className="mb-3">
                  <label htmlFor="Country" className="form-label mr-3">
                    Country
                  </label>

                  <select
                    id="Country"
                    className="form-select"
                  >
                    <option>England</option>
                    <option>Wales</option>
                    <option>Scotland</option>
                    <option>France</option>
                    <option>Belgium</option>
                    <option>Japan</option>
                  </select>
                </div>
              </fieldset>

              <div className="col-12">
                <button className="btn btn-primary">
                  Pay Now
                </button>
              </div>
            </form>
          </div>
        </div>
        </div>

      </div>
    </section>
  );
};

export default CheckoutForm;
