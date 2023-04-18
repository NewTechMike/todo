import React from 'react'
import { NavLink } from 'react-router-dom'

function NavBar(){

  return(
    <div>
      <NavLink
       to="/welcome"
      > Welcome
      </NavLink>
      
      <NavLink
       to="/login"
      > Login
      </NavLink>
  </div>
  )
}

export default NavBar;