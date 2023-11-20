import "./App.css";
import Header from "./app/shared/Header";
import Footer from "./app/shared/Footer";
import AllRoutes from "./routes/AllRoutes";

/*
Css
 */
import "../src/assets/frontend/css/animate.css";
import "../src/assets/frontend/css/bootstrap.min.css";
import "../src/assets/frontend/css/magnific-popup.css";
import "../src/assets/frontend/css/owl.carousel.min.css";
import "../src/assets/frontend/css/font-awesome.min.css";
import "../src/assets/backend/css/fontawesome.min.css";
import "../src/assets/backend/css/flaticon.css";
import "../src/assets/frontend/css/flaticon.css";
import "../src/assets/frontend/css/style.css";
import "../src/assets/frontend/css/responsive.css";
import "../src/assets/frontend/css/custom-style.css";
import "../src/assets/frontend/css/jquery.ihavecookies.css";
import "../src/assets/frontend/css/dynamic-style.css";
import "../src/assets/common/css/toastr.css";

function App() {
  return (
    <>
       <Header />
      <AllRoutes />
       <Footer />
    </>
  );
}

export default App;
