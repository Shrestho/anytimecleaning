import { Routes, Route } from 'react-router-dom';
import FAQ from '../app/components/FAQ';
import NotFoundPage from '../app/components/NotFoundPage';
import CategoriesAll from '../app/pages/Categories/CategoriesAll';
import CheckoutForm from '../app/pages/CheckoutForm/CheckoutForm';
import Contact from '../app/pages/Contact/Contact';
import Home from '../app/pages/Home/Home';
import ProductsAll from '../app/pages/Services/Services';
import Shop from '../app/pages/Shop/Shop';
import About from '../app/pages/About/About';
import Login from '../app/pages/Authentication/Login';
import ProviderSignup from '../app/pages/Authentication/Provider/ProviderSignup';
import UserSignup from '../app/pages/Authentication/User/UserSignup';
import Service from '../app/pages/Services/Service';
import Booking from '../app/pages/Booking/Booking';
// import ConfirmBooking from '../app/components/Booking/ConfirmBooking';
import Confirmation from '../app/pages/Booking/Confirmation';
import ProviderProfile from '../app/pages/Provider/ProviderProfile';
import Providers from '../app/pages/Provider/Providers';
import Dashboard from '../app/pages/Dashboard/Index';
import Account from '../app/pages/Dashboard/Account';
import Address from '../app/pages/Dashboard/Address';
import Orders from '../app/pages/Dashboard/Orders';
import PrivateOutlet from '../app/components/PrivateOutlet';

const AllRoutes = () => {
  return (
    <Routes>
      <Route path='/' element={<Home />} />
      <Route path='/home' element={<Home />} />
      <Route path='/shop' element={<Shop />} />
      <Route path='/categories' element={<CategoriesAll />} />
      <Route path='/services' element={<ProductsAll />} />
      <Route path='/checkout' element={<CheckoutForm />} />
      <Route path='/faq' element={<FAQ />} />
      <Route path='/contact' element={<Contact />} />
      <Route path='/about' element={<About />} />
      <Route path='/login' element={<Login />} />
      <Route path='/provider-signup' element={<ProviderSignup />} />
      <Route path='/user-signup' element={<UserSignup />} />
      <Route path='/service/:id' element={<Service />} />
      <Route path='/confirmation' element={<Confirmation />} />
      <Route path='/provider/:id' element={<ProviderProfile />} />
      <Route path='/providers' element={<Providers />} />
      <Route path='*' element={<NotFoundPage />} />
      <Route path='/*' element={<PrivateOutlet />}>
        <Route path='dashboard' element={<Dashboard />} />
        <Route path='dashboard/account' element={<Account />} />
        <Route path='dashboard/address' element={<Address />} />
        <Route path='dashboard/orders' element={<Orders />} />
        <Route path='service-booking/:id' element={<Booking />} />
        {/* <Route path="confirm-booking" element={<ConfirmBooking/>}/> */}
      </Route>
    </Routes>
  );
};

export default AllRoutes;
