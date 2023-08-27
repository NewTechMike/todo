import React, { useEffect, useState } from "react";

function Lists(){
const [lists, setLists ] = useState([])

  useEffect(()=>{
    fetch('/lists')
    .then((r)=>r.json())
    .then((listData)=>setLists(listData))
  },[])

  const showLists = lists.map((listObj) =>
    <ul key={listObj.id}> {listObj.name} </ul>
  ); 

  function handleListSubmit(e){
    e.preventDefault();
    console.log("submit was triggered")
  }
  
  //<button onClick={handleCreateClick}>Create New List</button>
  return(
    <div>
      <div> The Lists </div>
     {showLists}
      <form onSubmit={handleListSubmit}>
        <input 
          type="text"
          id="newlist"
          autoComplete="off"
          onChange={(e)=>setLists(...Lists, e.target.value)}
          ></input>
          <button type="submit">Create New List</button>
      </form>
     
    </div>
  )
}

export default Lists;