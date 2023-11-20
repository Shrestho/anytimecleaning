import { useEffect, useState } from "react";
import RootURL from '../../components/Contants';
import Cookies from "js-cookie";

const useOrders = () => {
  const [booking, setBooking] = useState({});
  const [reload, setReload] = useState(false);
  useEffect(() => {
    const api_token = Cookies.get('api_token');
    fetch(RootURL +'bookings', {
      mode: 'no-cors',
      credentials: "include",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${api_token}`
      },
    })
      .then((response) => response.json())
      .then((data) => {
        setBooking(data);
        console.log(data);
      });
  }, []);

  return {
    booking,
    setBooking,
    reload,
    setReload,
  };
};

export default useOrders;