import { useEffect, useState } from "react";
import RootURL from '../components/Contants'
const useServices = () => {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
      fetch(RootURL + 'e_services')
    // fetch(`https://api.anytimecleaning.net/public/api/e_services`)
      // fetch(`https://home-services.smartersvision.com/api/e_services`)
      .then((response) => response.json())
      .then((data) => {
        setLoading(false);
        setProducts(data?.data);
        console.log(data?.data);
      });
  }, []);
  return { products, setProducts, loading };
};

export default useServices;
