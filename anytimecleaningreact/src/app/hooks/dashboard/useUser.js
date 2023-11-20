import { useEffect, useState } from "react";
import RootURL from '../../components/Contants';

const useUser = ({api_token}) => {
  const [user, setUser] = useState({});
  const [reload, setReload] = useState(false);
  useEffect(() => {
    fetch(RootURL+`user?api_token=${api_token}`)
      .then((response) => response.json())
      .then((data) => {
        setUser(data);
        console.log(data);
      });
  }, []);

  return {
    user,
    setUser,
    reload,
    setReload,
  };
};

export default useUser;
