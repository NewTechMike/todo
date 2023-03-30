import React from 'react';

function Welcome(){

  const something = "something"

  console.log("something now")
  return(
    <div>
      <h1>This is the Welcome Page</h1>
     {something}      
    </div>
  )
}

export default Welcome;