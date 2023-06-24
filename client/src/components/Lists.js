import React, { useEffect, useState } from "react";

function Lists(){
const [lists, setLists ] = useState([])

  useEffect(()=>{
    fetch('/lists')
    .then((r)=>r.json())
    .then((listData)=>console.log(listData))
  },[])

  /* const showLists = lists.map((listObj) =>
    
  ); */
  
  return(

    <div> The Lists </div>
  )
}

export default Lists;