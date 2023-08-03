import React, { useState, useContext } from 'react';
import { UserContext } from '../context/user';

function Login(){
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const { setUser, loggedIn, setLoggedIn } = useContext(UserContext);

  function handleSubmit(e){
    e.preventDefault();
    fetch("/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username, password }),
    }).then((r) => {
      if(r.ok) {
        r.json().then((user) => setUser(user));
        setLoggedIn(true)
      } else {
        r.json().then((errorData) => console.log("Errors: ", errorData.error))
      }
    });
    console.log("submit was triggered")
    //This is what I'm currently working on. After which
    
  }

  return(
    <div>
      <h1> Login Page </h1>
      <form onSubmit={handleSubmit}>
        <label htmlFor="username" style={{color: "dark blue"}}>
          UserName
        </label>
        <input  
          type="text"
          id="username"
          value={username}
          autoComplete="off"
          onChange={(e) => setUsername(e.target.value)}/>

          <label htmlFor="password" style={{color: "dark blue"}}>
            Password
          </label>
          <input 
            type="password"
            id="password"
            value={password}
            autoComplete="off"
            onChange={(e) => setPassword(e.target.value)}
            ></input>

            <button type="submit">Login</button>
      </form>
    </div>
  )
}

export default Login;