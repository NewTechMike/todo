import React, { useState } from 'react';

function Login(){
  const [username, setUsername] = useState("");


  function handleSubmit(e){
    e.preventDefault();
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

      </form>
    </div>
  )
}

export default Login;