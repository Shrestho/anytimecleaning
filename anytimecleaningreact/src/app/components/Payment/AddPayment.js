import { CardCvcElement, CardExpiryElement, CardNumberElement, useElements, useStripe } from "@stripe/react-stripe-js"
import { useMemo, useState } from "react"
import axios from 'axios';
import RootURL from '../../components/Contants';
import Cookies from 'js-cookie';

const useCardNumberOptions = () => {
    const cardNumberOptions = useMemo(
        () => ({
            placeholder: 'Card Number',
            style: {
                base: {
                    alignItems: 'center',
                    flex: 1,
                    justifyContent: 'center',
                    color: '#BCCAC7',
                    fontSize: '16px',
                    letterSpacing: '0.025em',
                    fontFamily: 'Metropolis, normal',
                    '::placeholder': {
                        color: '#aab7c4'
                    }
                },
                invalid: {
                    color: '#9e2146'
                }
            }
        }),
        []
    )
    return cardNumberOptions
}

const useExpiredOptions = () => {
    const expiredOptions = useMemo(
        () => ({
            placeholder: 'Expiry Date',
            style: {
                base: {
                    alignItems: 'center',
                    flex: 1,
                    justifyContent: 'center',
                    color: '#BCCAC7',
                    fontSize: '16px',
                    letterSpacing: '0.025em',
                    fontFamily: 'Metropolis, normal',
                    '::placeholder': {
                        color: '#aab7c4'
                    }
                },
                invalid: {
                    color: '#9e2146'
                }
            }
        }),
        []
    )
    return expiredOptions
}

const useCvvOptions = () => {
    const cvvOptions = useMemo(
        () => ({
            placeholder: 'CVV',
            style: {
                base: {
                    alignItems: 'center',
                    flex: 1,
                    justifyContent: 'center',
                    color: '#BCCAC7',
                    fontSize: '16px',
                    letterSpacing: '0.025em',
                    fontFamily: 'Metropolis, normal',
                    '::placeholder': {
                        color: '#aab7c4'
                    }
                },
                invalid: {
                    color: '#9e2146'
                }
            }
        }),
        []
    )
    return cvvOptions
}

const AddPayment = ({user,service,bookingData, paymentMethod}) => {
    const stripe = useStripe()
    const elements = useElements()
    const cardNumberOptions = useCardNumberOptions()
    const expiredOptions = useExpiredOptions()
    const cvvOptions = useCvvOptions();
    const cookies = Cookies.get('api_token');
  const [message, setMessage] = useState('');

    const handlePayment = async(event) =>{
        event.preventDefault();
        const CardElement = elements.getElement(CardNumberElement)
        const payment = await stripe.createSource(CardElement, {
            type: 'card',
            amount: Math.round(service?.price*100),
            owner: {
                name: `${user?.name}`,
                email: user?.email,
                phone: user?.phone_number
            }
        })
        console.log("payment:",payment);
        if(payment){

            // create payment
            await axios
            .post(RootURL + `payment`, {id:bookingData?.id, payment_method_id:paymentMethod}, {
              headers: {
                Authorization: 'Bearer ' + cookies,
              },
            })
            .then((response) => {
              setMessage(response?.data?.message);
            })
            .catch((error) => {
              setMessage('Failed to update!');
            });

            // create wallets
            await axios
            .post(RootURL + `wallets`, {name: "My USD Wallet for booking", user: user?.id}, {
            headers: {
                Authorization: 'Bearer ' + cookies,
            },
            })
            .then((response) => {
            })
            .catch((error) => {
            setMessage('Failed to create wallets!');
            });
        }
    }

    return(
        <div>
        <div className="pt-5">
          <div className="font-weight-bold text-center" style={{ fontSize: '23px' }}>
            <p className="">Payment</p>
          </div>
          {message && (
              <div className='p-3 m-3 text-white bg-success'>{message}</div>
            )}
        </div>
        <div className="px-5 py-4">
          <form onSubmit="(function(e) {e.preventDefault()})()">
            <div className="">
              <CardNumberElement options={cardNumberOptions} id="ccnumber" className='form-control py-2 pl-2 w-100 border border-1 border-secondary' type="text" name='card_number' />
            </div>
            <div className="row g-3 pt-3">
              <div className="col">
                <CardExpiryElement options={expiredOptions} id="ccexpiry" className='form-control py-2 pl-2 mt-1 border border-1 border-secondary' type="text" name='exp_date' placeholder='Expiry Date' />
              </div>
              <div className="col">
                <CardCvcElement options={cvvOptions} className='form-control py-2 pl-2 mt-1 border border-1 border-secondary' type="text" name='email' placeholder='CVV' />
              </div>
            </div>
            <div></div>
            <div className="d-flex py-3">
              <div className="pr-2">
                <button className="btn btn-secondary">CANCEL</button>
              </div>
              <div className="">
                <button onClick={handlePayment} className="btn btn-success">Purchase</button>
              </div>
            </div>
          </form>
        </div>
      </div>
)
}
export default AddPayment