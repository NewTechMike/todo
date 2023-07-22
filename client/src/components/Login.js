import React, { useState } from 'react';

function Login(){
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

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
        r.json().then((user) => console.log("User: ", user));
      } else {
        r.json().then((errorData) => console.log("Errors: ", errorData.error))
      }
    });
    console.log("submit was triggered")
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