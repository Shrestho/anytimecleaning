import { useEffect, useState } from 'react';
import RootURL from '../components/Contants';

const useBooking = (id) => {
  const [booking, setBooking] = useState({});
  const [reload, setReload] = useState(false);
  useEffect(() => {
    const getBookingData = async () => {
      await fetch(RootURL + `bookings/${id}`, {
        mode: 'cors',
      })
        .then((response) => response.json())
        .then((data) => {
          setBooking(data);
          console.log(data);
        });
    };
    getBookingData();
  }, [id]);
  return {
    booking,
    setBooking,
    reload,
    setReload,
  };
};

export default useBooking;
