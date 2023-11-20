import React, {useState} from "react";
import { Link} from "react-router-dom";
import "../Login.css";
import RootURL from '../../../components/Contants'

const ProviderSignup = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [phone_number, setPhoneNumber] = useState('');
  const submitHandler = async (e) => {
    e.preventDefault();
    await fetch(RootURL + 'provider/register', {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({
        name,
        email,
        password,
        phone_number})
    }).then(response => console.log(response))
  }

  return (
      <div className="container-fluid h-100 custom">
        <div className="row justify-content-center align-items-center h-100">
          <div className="col-sm-12 col-md-6 login-form">
            <h2 className="text-center">Register as a Provider</h2>
            <form>
              <div className="form-group">
                <label htmlFor="name">Full Name</label>
                <input type="text" className="form-control" name="name" id="name"
                       placeholder="Enter Full Name"
                       onChange={(e) => setName(e.target.value)}/>
              </div>
              <div className="form-group">
                <label htmlFor="Email">Email:</label>
                <input type="text" className="form-control" name="email" id="email"
                       placeholder="Enter email"
                       onChange={(e) => setEmail(e.target.value)}/>
              </div>
              <div className="form-group">
                <label htmlFor="password">Password:</label>
                <input type="password" className="form-control" id="password"
                       name="password" placeholder="Enter password"
                       onChange={(e) => setPassword(e.target.value)}/>
              </div>
              <div className="form-group">
                <label htmlFor="confirm-password">Confirm Password:</label>
                <input type="password" name="password" className="form-control" id="confirm-password"
                       placeholder="Confirm password"/>
              </div>
              <div className="form-group">
                <label htmlFor="phone_number">Phone Number:</label>
                <input type="text" name="phone_number" className="form-control" id="phone_number"
                       placeholder="Enter Phone Number" onChange={e => setPhoneNumber(e.target.value)}/>
              </div>
              <div className="text-center">
                <button type="submit" className="btn btn-primary mx-auto" onClick={submitHandler}>Register
                </button>
              </div>
              <p className="text-center m-4">Already have an account? <Link to="/login"
                                                                            style={{color: "blue"}}>Login</Link>
              </p>
            </form>
            {/*<p className="text-center">Provider? <Link to="/provider">Login here.</Link></p>*/}
          </div>
        </div>
      </div>
  );
};

export default ProviderSignup;
