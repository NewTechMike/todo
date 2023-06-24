import React from 'react'
import { NavLink } from 'react-router-dom'

function NavBar(){

  return(
    <div>
      <NavLink
      bg="light"
      variant="dark"
       to="/welcome"
       active={{ color: "light green"}}
      > Welcome
      </NavLink>

      <NavLink
       to="/login"
      > Login
      </NavLink>
      <NavLink
       to="/home"
      > Home
      </NavLink>


  </div>
  )
}

export default NavBar;