import { useEffect, useState } from "react";
import RootURL from '../components/Contants'

const useFaqs = () => {
  const [faqs, setFaqs] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(RootURL + `faqs`)
      .then((response) => response.json())
      .then((data) => {
        setLoading(false);
        setFaqs(data?.data);
        console.log(data?.data);
      });
  }, []);
  return { faqs, setFaqs, loading };
};

export default useFaqs;
